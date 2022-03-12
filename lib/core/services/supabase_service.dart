import 'package:aomlah/core/app/logger.dart';
import 'package:aomlah/core/enums/aomlah_functions.dart';
import 'package:aomlah/core/enums/aomlah_tables.dart';
import 'package:aomlah/core/enums/trade_state.dart';
import 'package:aomlah/core/models/aomlah_user.dart';
import 'package:aomlah/core/models/bank_account.dart';
import 'package:aomlah/core/models/dispute.dart';
import 'package:aomlah/core/models/offer.dart';
import 'package:aomlah/core/models/trade.dart';
import 'package:aomlah/core/models/wallet.dart';
import 'package:aomlah/core/services/abstract_supabase.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService extends AbstractSupabase {
  final _logger = getLogger("SupabaseService");

  // Returns an initilized SupabaseService instance to be used by locator
  static Future<SupabaseService> getInstance() async {
    final service = SupabaseService();
    await service.initlizeSupabase();
    return service;
  }

  Future<void> initlizeSupabase() async {
    await Supabase.initialize(
      url: 'https://ovnvhtboyihfvpujfynw.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTY0MzYzNjg5NCwiZXhwIjoxOTU5MjEyODk0fQ.Fgqh3Fs8ovWy0BgSd1FokQimrMNtYPa4_-uPh7B9FtY',
      debug: true,
    );
    supabase = Supabase.instance.client;
  }

  Future<void> createUserProfile({
    required String uuid,
    required String name,
  }) async {
    await insert(AomlahTable.profiles, {"profile_id": uuid, "name": name});
  }

  Future<void> updateUserProfile(
    String uuid,
    String name,
  ) async {
    await update(AomlahTable.profiles, {"name": name}, {"profile_id": uuid});
  }

  // update user debt with debt value
  // +value to increase debt
  // -value to decrease debt
  Future<void> updateUserDebt(
    String uuid,
    double debt,
  ) async {
    await callFn(AomlahFunction.deduct_debt.name, (json) => null, params: {
      "user_id": uuid,
      "amount": debt,
    });
  }

  Future<void> updateUserStatus(
      {required String uuid, required bool status}) async {
    await update(
        AomlahTable.profiles, {"is_online": status}, {"profile_id": uuid});
  }

  Stream<AomlahUser> getUserStream(String uuid) {
    return subscribeForChanges<AomlahUser>(
        table: AomlahTable.profiles,
        fromJson: (_) {
          return AomlahUser.anonymous();
        },
        primaryKey: "profile_id",
        query: {
          "profile_id": uuid,
        }).asyncMap<AomlahUser>((event) {
      return getUser(uuid);
    });
  }

  Future<AomlahUser> getUser(String uuid) async {
    final res = await get<AomlahUser>(
      AomlahTable.view_profiles,
      AomlahUser.fromJson,
      query: {"profile_id": uuid},
    );

    return res.first;
  }

  Future<List<Offer>> _getOffers({Map<String, String>? query}) {
    return get<Offer>(
      AomlahTable.view_offers,
      Offer.fromJson,
      query: query,
    );
  }

  // All offers controller
  BehaviorSubject<List<Offer>> offersController =
      BehaviorSubject<List<Offer>>();

  // Listen for changes on offers table and fetches from view_offers on every offers table change
  void listentoAllOffers() {
    subscribeForChanges<Offer>(
      table: AomlahTable.offers,
      fromJson: Offer.fromJson,
      primaryKey: "offer_id",
    ).asyncMap((event) {
      return _getOffers();
    }).listen((offers) {
      offersController.sink.add(offers);
    });
  }

  Future<void> createOffer(Offer offer) async {
    await insert(AomlahTable.offers, offer.toJson());
  }

  Future<void> updateOfferRemainingQuantity({
    required String offerId,
    required double remaining,
  }) async {
    await upsert(AomlahTable.offers, {
      "offer_id": offerId,
      "remaining_quantity": remaining,
    });
  }

  // User's own offers controller
  BehaviorSubject<List<Offer>> userOffersController =
      BehaviorSubject<List<Offer>>();

  // Listen for changes on offers table and fetches from view_offers on every offers table change
  // and sink it to [userOffersController].
  void listenToUserOffers(String uuid) {
    final query = {"owner_id": uuid};
    subscribeForChanges<Offer>(
      table: AomlahTable.offers,
      fromJson: Offer.fromJson,
      primaryKey: "offer_id",
      query: query,
    ).asyncMap((_) {
      return _getOffers(query: query);
    }).listen((offers) {
      userOffersController.sink.add(offers);
    });
  }

  // User's own offers controller
  late BehaviorSubject<List<Trade>> offerTradesController;

  // Listen for changes on trades table and fetches from view_trades
  // and sink it to [offerTradesController].
  void listenToOfferTrades(String offerId) {
    offerTradesController = BehaviorSubject<List<Trade>>();

    final query = {"offer_id": offerId};
    subscribeForChanges<Trade>(
      table: AomlahTable.trades,
      fromJson: Trade.fromJson,
      primaryKey: "trade_id",
      query: query,
    ).asyncMap((_) {
      return _getOfferTrades(query: query);
    }).listen((trades) {
      offerTradesController.sink.add(trades);
    });
  }

  Future<List<Trade>> _getOfferTrades({required Map<String, String> query}) {
    return get<Trade>(
      AomlahTable.view_trades,
      Trade.fromJson,
      query: query,
    );
  }

  Future<void> createBank(BankAccount account) async {
    await insert(AomlahTable.bank_accounts, account.toJson());
  }

  Future<void> createWallet(
    Wallet wallet,
  ) async {
    await upsert(AomlahTable.wallets, wallet.toJson());
  }

  Future<void> deleteBankAccount(
    BankAccount wallet,
  ) async {
    await delete(
      AomlahTable.bank_accounts,
      {
        "iban": wallet.iban,
      },
    );
  }

  Future<Trade> createTrade(Trade trade) async {
    final res = await upsert(AomlahTable.trades, trade.toJson());

    if (res.error != null) {
      throw Exception(res.error!.message);
    }
    return getTrade(trade.tradeId);
  }

  Future<Dispute> createDispute(Dispute dispute) async {
    final res = await upsert(AomlahTable.disputes, dispute.toJson());

    if (res.error != null) {
      throw Exception(res.error!.message);
    }
    return getDispute(dispute.disputeId);
  }

  Stream<Trade> getTradeStream(String tradeId) {
    final disputeStream = subscribeForChanges(
        table: AomlahTable.disputes,
        fromJson: (_) => Dispute.dummy(),
        primaryKey: "dispute_id",
        query: {
          "trade_id": tradeId,
        });
    final tradeStream = subscribeForChanges(
      table: AomlahTable.trades,
      fromJson: Trade.fromJson,
      primaryKey: "trade_id",
    );

    final mergedStream = CombineLatestStream.list([disputeStream, tradeStream]);

    return mergedStream.asyncMap(
      (event) => getTrade(tradeId),
    );
  }

  // Listen for changes on trades table and fetches from view_trades
  // and sink it to [offerTradesController].
  Stream<List<Trade>> getUserTradesStream(String uuid) {
    final query = {"trader_id": uuid};
    return subscribeForChanges<Trade>(
      table: AomlahTable.trades,
      fromJson: Trade.fromJson,
      primaryKey: "trade_id",
      query: query,
    ).asyncMap((_) {
      return _getOfferTrades(query: query);
    });
  }

  Future<void> changeTradeStatus(String tradeId, TradeStatus status) async {
    await upsert(
      AomlahTable.trades,
      {
        "trade_id": tradeId,
        "status": status.name,
      },
    );
  }

  Future<Trade> getTrade(String tradeId) async {
    final res = await get<Trade>(
      AomlahTable.view_trades,
      Trade.fromJson,
      query: {
        "trade_id": tradeId,
      },
    );
    return res.first;
  }

  Future<Dispute> getDispute(String disputeId) async {
    final res = await get<Dispute>(
      AomlahTable.disputes,
      Dispute.fromJson,
      query: {
        "dispute_id": disputeId,
      },
    );
    print(res);
    return res.first;
  }
}
