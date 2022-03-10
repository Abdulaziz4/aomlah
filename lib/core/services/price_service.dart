import 'dart:convert';

import 'package:rxdart/rxdart.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:aomlah/core/app/api_keys.dart';
import 'package:aomlah/core/app/logger.dart';
import 'package:aomlah/core/enums/crypto_types.dart';
import 'package:aomlah/core/models/price_ticker.dart';

abstract class PriceService<T extends PriceTicker> {
  final _logger = getLogger("PriceService");

  final String apiKey = APIKeys.cryptoCompKey;
  // final apiKeyEth = APIKeys.cryptoCompKeyEth;
  final baseUrl = "wss://streamer.cryptocompare.com/v2";

  BehaviorSubject<T> priceContrller = BehaviorSubject<T>();
  // BehaviorSubject<Ethereum> priceControllerEth = BehaviorSubject<Ethereum>();

  void connect(CryptoTypes types) {
    _logger.i("$types Price Socket Connected");
    try {
      final url = "$baseUrl?api_key=$apiKey";
      final channel = WebSocketChannel.connect(
        Uri.parse(url),
      );
      channel.sink.add(jsonEncode(connectionMessage()));

      channel.stream.listen((event) {
        final Map<String, dynamic> response = jsonDecode(event);
        if (response["TYPE"] == "2" && (response["PRICE"] != null)) {
          // final coin = PriceTicker(response["PRICE"] * 1.0);
          // priceContrller.sink.add(coin);
          sinkTicker(response["PRICE"] * 1.0);
        }
      });
    } catch (e) {
      _logger.e(e);
    }
  }

  Map<String, dynamic> connectionMessage();

  void sinkTicker(double price);
}
