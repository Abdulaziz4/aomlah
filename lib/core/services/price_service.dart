import 'dart:convert';

import 'package:aomlah/core/app/logger.dart';
import 'package:aomlah/core/models/bitcoin.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class PriceService {
  final _logger = getLogger("PriceService");

  final apiKey =
      "af86a1499b576f1fec8c58df5cfc702ca2cc714557bebd0f52a8b38752ea6335";
  final baseUrl = "wss://streamer.cryptocompare.com/v2";

  BehaviorSubject<Bitcoin> priceContrller = BehaviorSubject<Bitcoin>();

  void connect() {
    _logger.i("Bitcoin Price Socket Connected");
    try {
      final url = "$baseUrl?api_key=$apiKey";
      final channel = WebSocketChannel.connect(
        Uri.parse(url),
      );
      channel.sink.add(jsonEncode(connectionMessage()));

      channel.stream.listen((event) {
        final Map<String, dynamic> response = jsonDecode(event);
        if (response["TYPE"] == "2" && (response["PRICE"] != null)) {
          final bitcoin = Bitcoin(response["PRICE"] * 1.0);
          priceContrller.sink.add(bitcoin);
        }
      });
    } catch (e) {
      _logger.e(e);
    }
  }

  Map<String, dynamic> connectionMessage() => {
        "action": "SubAdd",
        "subs": ["2~Binance~BTC~USDT"]
      };
}
