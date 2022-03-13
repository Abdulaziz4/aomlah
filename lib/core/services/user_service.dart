import 'package:rxdart/rxdart.dart';

import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/services/realtime_wallet_service.dart';
import 'package:aomlah/core/services/supabase_service.dart';
import 'package:aomlah/core/app/logger.dart';
import 'package:aomlah/core/models/aomlah_user.dart';

class UserService {
  late AomlahUser user;

  final _logger = getLogger("UserService");

  final _supabaseService = locator<SupabaseService>();
  final _realtimeWalletService = locator<RealtimeWalletService>();

  late BehaviorSubject<AomlahUser> userController;

  Future<void> initUser(String uuid) async {
    userController = BehaviorSubject<AomlahUser>();
    final userStream = _supabaseService.getUserStream(uuid);

    // Pipe user stream to the controller stream
    userStream.listen(userController.sink.add);

    // Wait until first event arrived before ending
    user = await userController.stream.first;

    userController.stream.listen((newUser) {
      user = newUser;
    });
    await _realtimeWalletService.connectWallet(
      uuid,
      user.wallet?.address ?? "",
    );
  }

  void updateUser(AomlahUser user) {
    _logger.i("updateUser | user=${user.toString()}");

    this.user = user;
    userController.add(user);
  }

  Future<void> fetchAndUpdateUser() async {
    _logger.i("fetchAndUpdateUser");

    final newUser = await _supabaseService.getUser(user.profileId);
    updateUser(newUser);
  }
}
