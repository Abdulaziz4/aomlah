import 'package:interactive_chart/interactive_chart.dart';
import 'package:stacked/stacked.dart';

import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/services/candles_service.dart';

class CryptoInfoViewModel extends BaseViewModel {
  final _candlesService = locator<CandlesService>();

  List<CandleData> candles = [];

  bool isFetchingInitial = false;

  Future<void> fetchCandles(
    String coinName,
    String interval, {
    bool isInitial = false,
  }) async {
    if (isInitial) {
      setFetchingInitial(true);
    } else {
      setBusy(true);
    }
    candles = await _candlesService.getCandles(coinName, interval);
    if (isInitial) {
      setFetchingInitial(false);
    } else {
      setBusy(false);
    }
  }

  void setFetchingInitial(bool value) {
    isFetchingInitial = value;
    notifyListeners();
  }
}
