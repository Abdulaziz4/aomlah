import 'dart:async';
import 'dart:convert';
import 'package:aomlah/core/app/logger.dart';
import 'package:http/http.dart' as http;

import 'package:aomlah/core/app/api_keys.dart';
import 'package:aomlah/core/app/utils/pinger.dart';
import 'package:rxdart/subjects.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class RealtimeWalletService {
  final _logger = getLogger("RealtimeWalletService");

  static const token = APIKeys.blockcypherKey;
  static const baseSocketUrl = "wss://socket.blockcypher.com/v1/bcy/test";
  static const baseUrl = "https://api.blockcypher.com/v1/bcy/test";

  BehaviorSubject<Map<String, dynamic>> walletController =
      BehaviorSubject<Map<String, dynamic>>();

  void connectWalletBalance(String address) {
    _logger.i("connectWalletBalance | address= $address");
    String url = "$baseUrl/addrs/$address";
    Timer walletTimer = Timer.periodic(Duration(seconds: 30), (timer) async {
      print("Request balance");
      print(address);
      final response = await http.get(Uri.parse(url));
      print(response.body);
      walletController.sink.add(jsonDecode(response.body));
    });
  }

  // void connectSocket(String uuid) {
  //   print("Connect Socket");
  //   const url = "$baseSocketUrl?token=$token";

  //   final channel = WebSocketChannel.connect(
  //     Uri.parse(url),
  //   );
  //   channel.sink.add(jsonEncode(connectionMessage(uuid)));
  //   Pinger.ping(channel, ping());

  //   channel.stream.listen((event) {
  //     print(event);

  //     final decodedEvent = jsonDecode(event);
  //     if (decodedEvent["event"] != "pong") {
  //       walletController.sink.add(decodedEvent);
  //     }
  //   });
  // }

  Map<String, dynamic> connectionMessage(String uuid) {
    return {
      "event": "confirmed-tx",
      "wallet_name": uuid,
      "token": token,
    };
  }

  Map<String, dynamic> ping() {
    return {
      "event": "ping",
    };
  }
}
