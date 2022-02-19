import 'dart:convert';

import 'package:aomlah/core/app/logger.dart';
// import 'package:candlesticks/candlesticks.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class CandlesService {
  final _logger = getLogger("CandlesService");

  final baseUrl = "wss://stream.binance.com:9443/ws";

  BehaviorSubject<List<Map<String, dynamic>>> candlesStream =
      BehaviorSubject<List<Map<String, dynamic>>>();

  late WebSocketChannel socketChannel;

  void connectSocket() {
    _logger.i("Connect Binance Socket for Charts");

    socketChannel = WebSocketChannel.connect(
      Uri.parse(baseUrl),
    );
    socketChannel.stream.listen((event) {
      print(event);
    });
  }

  void subscribeToToken(String coinName) {
    socketChannel.sink.add(
      jsonEncode(_coinConnectionMessage(coinName, null)),
    );
  }

  // Future<List<Candle>> fetchInitialCandles(String coinName) async {
  //   final uri = Uri.parse(
  //     "https://api.binance.com/api/v3/klines?symbol=$coinNameUSDT&interval=1m&limit=1000",
  //   );
  // }

  Map<String, dynamic> _coinConnectionMessage(
    String coinName,
    String? interval,
  ) {
    return {
      "method": "SUBSCRIBE",
      "params": ["btcusdt@kline_1d"],
      "id": 1
    };
  }
}
