import 'dart:async';
import 'dart:convert';

import 'package:aomlah/core/models/btc_real_time_wallet.dart';
import 'package:rxdart/subjects.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:aomlah/core/app/api_keys.dart';
import 'package:aomlah/core/app/utils/pinger.dart';
import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/logger.dart';
import 'package:aomlah/core/services/wallet_managment_service.dart';

class RealtimeWalletService {
  final _logger = getLogger("RealtimeWalletService");

  final _walletManager = locator<WalletManagmentService>();

  static const token = APIKeys.blockcypherKey;
  static const baseSocketUrl = "wss://socket.blockcypher.com/v1/bcy/test";
  static const baseUrl = "https://api.blockcypher.com/v1/bcy/test";

  BehaviorSubject<BtcRealTimeWallet> walletController =
      BehaviorSubject<BtcRealTimeWallet>();

  Future<void> connectWallet(String uuid, String address) async {
    _logger.i("connectWallet | args: uuid= $uuid , address=$address");
    const socketUrl = "$baseSocketUrl?token=$token";

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
