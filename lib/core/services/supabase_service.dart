import 'package:aomlah/core/enums/aomlah_tables.dart';
import 'package:aomlah/core/models/aomlah_user.dart';
import 'package:aomlah/core/models/bank_account.dart';
import 'package:aomlah/core/models/offer.dart';
import 'package:aomlah/core/models/wallet.dart';
import 'package:aomlah/core/services/abstract_supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService extends AbstractSupabase {
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

  Future<List<Offer>> getAllOffer() async {
    return get(AomlahTable.offers, Offer.fromJson);
  }

  Stream<List<Offer>> getAllOffersSubscription() {
    return subscribeForChanges<Offer>(
      table: AomlahTable.offers,
      fromJson: Offer.fromJson,
      primaryKey: "offer_id",
    );
  }

  Future<void> createOffer(Offer offer) async {
    await insert(AomlahTable.offers, offer.toJson());
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
}
