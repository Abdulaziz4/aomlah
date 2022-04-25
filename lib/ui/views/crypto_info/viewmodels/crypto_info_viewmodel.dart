import 'package:aomlah/core/app/logger.dart';
import 'package:aomlah/core/models/coin.dart';
import 'package:aomlah/core/services/crypto_info_service.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:stacked/stacked.dart';

import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/services/candles_service.dart';

class CryptoInfoViewModel extends StreamViewModel<List<Coin>> {
  final _logger = getLogger("CryptoInfoViewModel");

  final _candlesService = locator<CandlesService>();
  final _coinService = locator<CryptoInfoService>();

  late Coin coin;

  List<CandleData> candles = [];

  bool isFetchingInitial = false;

  bool isNotSupported = false;

  void initCoin(Coin recCoin) {
    coin = recCoin;
  }

  @override
  void onData(List<Coin>? data) {
    _logger.i("onData");
    super.onData(data);
    if (data != null) {
      coin = data.firstWhere((c) => c.id == coin.id);
    }
  }

  @override
  void onError(error) {
    super.onError(error);
    _logger.e("Error while fetching coins $error");
  }

  Future<void> fetchCandles(
    String coinName,
    String interval, {
    bool isInitial = false,
  }) async {
    try {
      if (isInitial) {
        setFetchingInitial(true);
      } else {
        setBusy(true);
      }
      candles = await _candlesService.getCandles(coinName, interval);
    } catch (exp) {
      _logger.e(exp);
      isNotSupported = true;
    } finally {
      if (isInitial) {
        setFetchingInitial(false);
      } else {
        setBusy(false);
      }
    }
  }

  void setFetchingInitial(bool value) {
    isFetchingInitial = value;
    notifyListeners();
  }

  @override
  Stream<List<Coin>> get stream => _coinService.cryptoStream.stream;
}
