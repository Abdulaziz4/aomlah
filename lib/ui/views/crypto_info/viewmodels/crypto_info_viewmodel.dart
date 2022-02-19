import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/services/candles_service.dart';
import 'package:stacked/stacked.dart';

class CryptoInfoViewModel extends StreamViewModel<List<Map<String, dynamic>>> {
  final _candlesService = locator<CandlesService>();

  void subscribeToToken(String coinName) {
    // _candlesService.subscribeToToken(coinName);
  }

  @override
  Stream<List<Map<String, dynamic>>> get stream =>
      _candlesService.candlesStream;
}
