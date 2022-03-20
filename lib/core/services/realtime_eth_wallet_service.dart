import 'dart:async';
import 'dart:convert';

import 'package:aomlah/core/models/real_time_wallet.dart';
import 'package:rxdart/subjects.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:aomlah/core/app/api_keys.dart';
import 'package:aomlah/core/app/utils/pinger.dart';
import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/logger.dart';

import '../models/eth_real_time_wallet.dart';
import 'eth_wallet_managment_service.dart';

class RealtimeEthWalletService {
  final _logger = getLogger("RealtimeEthWalletService");

  final _walletManager = locator<EthWalletManagmentService>();

  static String token = APIKeys.blockcypherKeyEth;
  static const baseSocketUrl = "wss://socket.blockcypher.com/v1/beth/test";
  static const baseUrl = "https://api.blockcypher.com/v1/beth/test";

  BehaviorSubject<EthRealTimeWallet> walletController =
      BehaviorSubject<EthRealTimeWallet>();

  Future<void> connectWallet(String uuid, String address) async {
    _logger.i("connectEthWallet | args: uuid= $uuid , address=$address");
    final socketUrl = "$baseSocketUrl?token=$token";

    // Fetch for first time
    final initialData = await _walletManager.getWalletInfo(address);
    walletController.sink.add(initialData);

    final channel = WebSocketChannel.connect(
      Uri.parse(socketUrl),
    );

    channel.sink.add(jsonEncode(connectionMessage(uuid, address)));
    Pinger.ping(channel, ping());

    channel.stream.listen((event) async {
      final decodedEvent = jsonDecode(event);
      if (decodedEvent["event"] != "pong") {
        // On new transaction update the wallet balance
        final updatedWallet = await _walletManager.getWalletInfo(address);

        walletController.sink.add(updatedWallet);
      }
    });
  }

  Map<String, dynamic> connectionMessage(String uuid, String address) {
    return {
      "event": "confirmed-tx",
      "wallet_name": uuid,
      "token": token,
      "address": address,
    };
  }

  Map<String, dynamic> ping() {
    return {
      "event": "ping",
    };
  }
}
