import 'dart:async';
import 'dart:convert';

import 'package:aomlah/core/models/coin.dart';
import 'package:http/http.dart' as http;
import 'package:aomlah/core/app/api_keys.dart';
import 'package:aomlah/core/app/logger.dart';
import 'package:rxdart/rxdart.dart';

class CryptoInfoService {
  final _logger = getLogger("CryptoInfoService");

  final apiKey = APIKeys.cryptoCompKey;
  final baseUrl =
      "https://min-api.cryptocompare.com/data/top/mktcapfull?limit=99&tsym=USD";

  BehaviorSubject<List<Coin>> cryptoStream = BehaviorSubject<List<Coin>>();

  void connectSocket() async {
    _logger.i("Connect Socket");

    // Request initial data
    final coins = await requestCryptoInfo();
    cryptoStream.sink.add(coins);

    // Start timer for updating the data
    Timer.periodic(Duration(seconds: 10), (timer) async {
      final coins = await requestCryptoInfo();
      cryptoStream.sink.add(coins);
    });
  }

  Future<List<Coin>> requestCryptoInfo() async {
    final res = await http.get(Uri.parse(baseUrl));

    final decodeRes = jsonDecode(res.body) as Map<String, dynamic>;
    List<Coin> coins = [];
    if (decodeRes["Message"] == "Success") {
      final coinsList = decodeRes["Data"] as List;
      coinsList.forEach((coin) {
        if (coin["DISPLAY"] != null) {
          coins.add(Coin.fromJson(coin));
        }
      });
    }
    return coins;
  }
}
