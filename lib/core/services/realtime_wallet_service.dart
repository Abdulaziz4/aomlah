import 'dart:convert';

import 'package:aomlah/core/app/api_keys.dart';
import 'package:aomlah/core/app/utils/pinger.dart';
import 'package:rxdart/subjects.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class RealtimeWalletService {
  static const token = APIKeys.blockcypherKey;
  static const baseSocketUrl = "wss://socket.blockcypher.com/v1/bcy/test";

  BehaviorSubject<Map<String, dynamic>> walletController =
      BehaviorSubject<Map<String, dynamic>>();

  void connectSocket(String uuid) {}

  // void connectSocket(String uuid) {
  //   print("Connect Socket");
  //   // const url = "$baseSocketUrl?token=$token";
  //   const url = "$baseSocketUrl";

  //   final channel = WebSocketChannel.connect(
  //     Uri.parse(url),
  //   );
  //   channel.sink.add(jsonEncode(connectionMessage(uuid)));
  //   Pinger.ping(channel, ping());

  //   channel.stream.listen((event) {
  //     print(event);
  //     final decodedEvent = jsonDecode(event);
  //     walletController.sink.add(decodedEvent);
  //   });
  // }

  Map<String, dynamic> connectionMessage(String uuid) {
    return {
      "event": "unconfirmed-tx",
      // "wallet_name": uuid,
      // "token": token,
    };
  }

  Map<String, dynamic> ping() {
    return {
      "event": "ping",
    };
  }
}
