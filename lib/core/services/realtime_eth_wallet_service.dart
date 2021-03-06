import 'dart:async';

import 'package:rxdart/subjects.dart';

import 'package:aomlah/core/app/api_keys.dart';
import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/logger.dart';

import '../models/eth_real_time_wallet.dart';
import 'eth_wallet_managment_service.dart';

class RealtimeEthWalletService {
  final _logger = getLogger("RealtimeEthWalletService");

  final _walletManager = locator<EthWalletManagmentService>();

  static final token = APIKeys.blockcypherKeyEth;
  static const baseSocketUrl = "wss://socket.blockcypher.com/v1/beth/test";
  static const baseUrl = "https://api.blockcypher.com/v1/beth/test";

  BehaviorSubject<EthRealTimeWallet> walletController =
      BehaviorSubject<EthRealTimeWallet>();

  Future<void> connectWallet(String uuid, String address) async {
    _logger.i("connectEthWallet | args: uuid= $uuid , address=$address");

    // Fetch for first time
    final initialData = await _walletManager.getWalletInfo(address);
    walletController.sink.add(initialData);

    Timer.periodic(Duration(seconds: 60), (timer) async {
      final initialData = await _walletManager.getWalletInfo(address);
      walletController.sink.add(initialData);
    });
  }
}
