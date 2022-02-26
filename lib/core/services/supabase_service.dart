import 'package:aomlah/core/app/logger.dart';
import 'package:aomlah/core/enums/aomlah_tables.dart';
import 'package:aomlah/core/enums/trade_state.dart';
import 'package:aomlah/core/models/aomlah_user.dart';
import 'package:aomlah/core/models/bank_account.dart';
import 'package:aomlah/core/models/offer.dart';
import 'package:aomlah/core/models/trade.dart';
import 'package:aomlah/core/models/wallet.dart';
import 'package:aomlah/core/services/abstract_supabase.dart';
import 'package:rxdart/subjects.dart';
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

  Future<void> updateUserStatus(
      {required String uuid, required bool status}) async {
    await update(
        AomlahTable.profiles, {"is_online": status}, {"profile_id": uuid});
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
    ;
  }

  Future<void> createOffer(Offer offer) async {
    await insert(AomlahTable.offers, offer.toJson());
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

  Stream<Trade> getTradeStream(String tradeId) {
    return subscribeForChanges(
        table: AomlahTable.trades,
        fromJson: Trade.fromJson,
        primaryKey: "trade_id",
        query: {
          "trade_id": tradeId,
        }).map<Trade>(
      (trades) => trades.first,
    );
  }

  Future<void> changeTradeStatus(String tradeId, TradeStatus status) async {
    final res = await upsert(
      AomlahTable.trades,
      {"trade_id": tradeId, "status": status.name},
    );
    print(res.error?.message);
  }

  Future<Trade> getTrade(String tradeId) async {
    final res = await get<Trade>(
      AomlahTable.view_trades,
      Trade.fromJson,
    );
    return res.first;
  }
}
