import 'dart:async';

import 'package:aomlah/core/enums/token_addresses.dart';
import 'package:aomlah/core/models/bat_real_time_wallet.dart';
import 'package:rxdart/rxdart.dart';
import '../app/app.locator.dart';
import '../app/logger.dart';
import '../models/uni_real_time_wallet.dart';
import '../models/usdt_real_time_wallet.dart';
import 'erc20_wallet_managment_service.dart';

class ERC20RealtimeWalletService {
  final _logger = getLogger("RealtimeEthWalletService");
  final _walletManager = locator<Erc20WalletManagmentService>();
  BehaviorSubject<UsdtRealTimeWallet> usdtWalletController =
      BehaviorSubject<UsdtRealTimeWallet>();
  BehaviorSubject<UniRealTimeWallet> uniWalletController =
      BehaviorSubject<UniRealTimeWallet>();
  BehaviorSubject<BatRealTimeWallet> batWalletController =
      BehaviorSubject<BatRealTimeWallet>();

  Future<void> connectWallet(String uuid, String address) async {
    _logger.i("connectERC20Wallet | args: uuid= $uuid , address=$address");
    if (address.substring(0, 2) != "0x") {
      address = "0x$address";
    }
    // Fetch for first time

    ///USDT REALTIME WALLET
    final initialUsdtData = await _walletManager.getERC20WalletBalance(
        address, TokenAddresses.usdtTokenAddress);
    usdtWalletController.sink.add(initialUsdtData as UsdtRealTimeWallet);

    ///UNISWAP REALTIME WALLET
    final initialUniData = await _walletManager.getERC20WalletBalance(
        address, TokenAddresses.uniTokenAddress);
    uniWalletController.sink.add(initialUniData as UniRealTimeWallet);

    ///BAT REALTIME WALLET
    final initialBatData = await _walletManager.getERC20WalletBalance(
        address, TokenAddresses.batTokenAddress);
    batWalletController.sink.add(initialBatData as BatRealTimeWallet);

    Timer.periodic(Duration(seconds: 60), (timer) async {
      ///USDT REALTIME WALLET
      final initialUsdtData = await _walletManager.getERC20WalletBalance(
          address, TokenAddresses.usdtTokenAddress);
      usdtWalletController.sink.add(initialUsdtData as UsdtRealTimeWallet);

      ///UNISWAP REALTIME WALLET
      final initialUniData = await _walletManager.getERC20WalletBalance(
          address, TokenAddresses.uniTokenAddress);
      uniWalletController.sink.add(initialUniData as UniRealTimeWallet);

      ///BAT REALTIME WALLET
      final initialBatData = await _walletManager.getERC20WalletBalance(
          address, TokenAddresses.batTokenAddress);
      batWalletController.sink.add(initialBatData as BatRealTimeWallet);
    });
  }
}
