import 'dart:async';
import 'dart:convert';
import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/logger.dart';
import 'package:aomlah/core/services/wallet_managment_service.dart';
import 'package:http/http.dart' as http;

import 'package:aomlah/core/app/api_keys.dart';
import 'package:aomlah/core/app/utils/pinger.dart';
import 'package:rxdart/subjects.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class RealtimeWalletService {
  final _logger = getLogger("RealtimeWalletService");

  final _walletManager = locator<WalletManagmentService>();

  static const token = APIKeys.blockcypherKey;
  static const baseSocketUrl = "wss://socket.blockcypher.com/v1/bcy/test";
  static const baseUrl = "https://api.blockcypher.com/v1/bcy/test";

  BehaviorSubject<Map<String, dynamic>> walletController =
      BehaviorSubject<Map<String, dynamic>>();

  // void connectWalletBalance(String address) {
  //   _logger.i("connectWalletBalance | address= $address");
  // String url = "$baseUrl/addrs/$address";
  //   Timer walletTimer = Timer.periodic(Duration(seconds: 30), (timer) async {
  //     print("Request balance");
  //     print(address);
  //     final response = await http.get(Uri.parse(url));
  //     print(response.body);
  //     walletController.sink.add(jsonDecode(response.body));
  //   });
  // }

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
      print(event);

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
