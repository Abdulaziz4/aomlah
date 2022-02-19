import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:aomlah/core/app/logger.dart';
import 'package:interactive_chart/interactive_chart.dart';

class CandlesService {
  final _logger = getLogger("CandlesService");

  Future<List<CandleData>> getCandles(String coinName, String interval) async {
    _logger.i("getCandles | args: coinName=$coinName, interval=$interval");

    final uri = Uri.parse(
        "https://api.binance.com/api/v3/klines?symbol=${coinName}USDT&interval=1m&limit=1000");

    final res = await http.get(uri);
    final decodedRes = jsonDecode(res.body) as List;

    return decodedRes.map((data) => candleFromJson(data as List)).toList();
  }

  CandleData candleFromJson(List<dynamic> json) {
    return CandleData(
      timestamp: json[0] * 1000,
      open: double.parse(json[1] as String),
      high: double.parse(json[2] as String),
      low: double.parse(json[3] as String),
      close: double.parse(json[4] as String),
      volume: double.parse(json[5] as String),
    );
  }
}
