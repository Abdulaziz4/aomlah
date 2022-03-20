import 'package:aomlah/core/app/logger.dart';
import 'package:aomlah/core/enums/aomlah_functions.dart';
import 'package:aomlah/core/enums/aomlah_tables.dart';
import 'package:aomlah/core/enums/trade_status.dart';
import 'package:aomlah/core/models/admin_report.dart';
import 'package:aomlah/core/models/aomlah_user.dart';
import 'package:aomlah/core/models/bank_account.dart';
import 'package:aomlah/core/models/dispute.dart';
import 'package:aomlah/core/models/offer.dart';
import 'package:aomlah/core/models/trade.dart';
import 'package:aomlah/core/models/wallet.dart';
import 'package:aomlah/core/services/abstract_supabase.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
      url: dotenv.env['SUPABASE_URL'],
      anonKey: dotenv.env['SUPABASE_ANON'],
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

  Future<int> getNumOfDisputedTrades(String offerId) async {
    final res = await supabase
        .rpc(
          AomlahFunction.num_of_disputed_trades.name,
          params: {"id_offer": offerId},
        )
        .select()
        .execute();
    return res.data;
  }

  Future<int> getNumOfOpenTrades(String offerId) async {
    final res = await supabase
        .rpc(
          AomlahFunction.num_of_open_trades.name,
          params: {"id_offer": offerId},
        )
        .select()
        .execute();
    return res.data;
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

  Future<void> createSellOffer(Offer offer, List<BankAccount> bank) async {
    await insert(AomlahTable.offers, offer.toJson());
    for (var i in bank) {
      await insert(AomlahTable.offer_bankaccounts,
          {"offer_id": offer.offerID, "iban": i.iban});
    }
  }

  Future<void> updateOfferRemainingQuantity({
    required String offerId,
    required double remaining,
  }) async {
    await update(
      AomlahTable.offers,
      {"remaining_quantity": remaining},
      {"offer_id": offerId},
    );
  }

  Future<void> closeOffer({
    required String offerId,
  }) async {
    await update(
      AomlahTable.offers,
      {"is_closed": true},
      {"offer_id": offerId},
    );
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

  Future<void> createEthWallet(Wallet ethWallet) async {
    await upsert(AomlahTable.eth_wallets, ethWallet.toJson());
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
    return res.first;
  }

  Future<AdminReport> getAdminReport() async {
    var result = await supabase
        .rpc(
          AomlahFunction.get_admin_report.name,
        )
        .select()
        .execute();
    return AdminReport.fromJson(result.data);
  }

  late BehaviorSubject<List<Dispute>> disputesController;

  void listenToDisputes() {
    disputesController = BehaviorSubject<List<Dispute>>();

    subscribeForChanges<Dispute>(
      table: AomlahTable.trades,
      fromJson: Dispute.fromJson,
      primaryKey: "dispute_id",
    ).asyncMap((_) {
      return _getDisputes();
    }).listen((disputes) {
      disputesController.sink.add(disputes);
    });
  }

  Future<List<Dispute>> _getDisputes() {
    return get<Dispute>(
      AomlahTable.view_disputes,
      Dispute.fromJson,
    );
  }
}
