import 'package:aomlah/core/enums/aomlah_tables.dart';
import 'package:aomlah/core/models/aomlah_user.dart';
import 'package:aomlah/core/models/offer.dart';
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

  Future<AomlahUser> getUser(String uuid) async {
    final res = await callFn<AomlahUser>("get_user", AomlahUser.fromJson,
        params: {"user_id": uuid});
    return res.first;
  }

  Future<List<Offer>> getAllOffer() async {
    return get(AomlahTable.offers, Offer.fromJson);
  }



  Future<void> createOffer(Offer offer) async {
    upsert(AomlahTable.offers, offer.toJson());
    print('done');
  }
}
