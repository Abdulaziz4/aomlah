import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/services/realtime_eth_wallet_service.dart';
import 'package:aomlah/core/services/realtime_erc20_wallet_service.dart';
import 'package:aomlah/core/services/realtime_wallet_service.dart';
import 'package:aomlah/core/services/supabase_service.dart';

import 'package:rxdart/rxdart.dart';

import 'package:aomlah/core/app/logger.dart';
import 'package:aomlah/core/models/aomlah_user.dart';

class UserService {
  late AomlahUser user;

  final _logger = getLogger("UserService");

  final _supabaseService = locator<SupabaseService>();
  final _realtimeWalletService = locator<RealtimeBtcWalletService>();
  final _realtimeEthWalletService = locator<RealtimeEthWalletService>();
  final _realtimeErc20WalletService = locator<ERC20RealtimeWalletService>();

  late BehaviorSubject<AomlahUser> userController;

  Future<void> initUser(String uuid) async {
    userController = BehaviorSubject<AomlahUser>();

    final userStream = _supabaseService.getUserStream(uuid);

    // Pipe user stream to the controller stream
    userStream.listen(userController.sink.add);

    // Wait until first event arrival before ending
    user = await userController.stream.first;

    userController.sink.add(user);
    userController.stream.listen((newUser) {
      user = newUser;
      _realtimeWalletService.updateWallet(user.btcWallet?.address ?? "");
    });

    await _realtimeWalletService.connectWallet(
      uuid,
      user.btcWallet?.address ?? "",
    );
    await _realtimeEthWalletService.connectWallet(
      uuid,
      user.ethWallet?.address ?? "",
    );
    await _realtimeErc20WalletService.connectWallet(
      uuid,
      user.ethWallet?.address ?? "",
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
