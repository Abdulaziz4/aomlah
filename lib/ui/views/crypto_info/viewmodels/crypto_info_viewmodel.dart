import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/services/candles_service.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:stacked/stacked.dart';

class CryptoInfoViewModel extends BaseViewModel {
  final _candlesService = locator<CandlesService>();

  List<CandleData> candles = [];

  Future<void> fetchCandles(String coinName) async {
    setBusy(true);
    candles = await _candlesService.getCandles(coinName, "");
    setBusy(false);
  }
}
