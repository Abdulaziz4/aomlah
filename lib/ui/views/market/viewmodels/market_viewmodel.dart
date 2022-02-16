import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/logger.dart';
import 'package:aomlah/core/models/coin.dart';
import 'package:aomlah/core/services/crypto_info_service.dart';
import 'package:stacked/stacked.dart';

class MarketViewmodel extends StreamViewModel<List<Coin>> {
  final _logger = getLogger("MarketViewmodel");

  final _cryptoService = locator<CryptoInfoService>();

  List<Coin> coins = [];
  void connectSocket() {
    _cryptoService.connectSocket();
  }

  @override
  void onData(List<Coin>? data) {
    super.onData(data);
    if (data != null) {
      coins = data;
    }
  }

  @override
  void onError(error) {
    super.onError(error);
    _logger.e("Error while fetching coins $error");
  }

  @override
  void onFutureError(error, Object? key) {
    super.onFutureError(error, key);
    _logger.e("Error while fetching coins $error");
  }

  @override
  Stream<List<Coin>> get stream => _cryptoService.cryptoStream.stream;
}
