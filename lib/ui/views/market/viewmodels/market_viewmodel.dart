import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/logger.dart';
import 'package:aomlah/core/models/coin.dart';
import 'package:aomlah/core/services/crypto_info_service.dart';
import 'package:aomlah/ui/views/market/market_view.dart';
import 'package:stacked/stacked.dart';

class MarketViewmodel extends StreamViewModel<List<Coin>> {
  final _logger = getLogger("MarketViewmodel");

  final _cryptoService = locator<CryptoInfoService>();

  List<Coin> coins = [];
  late CoinDataSource dataSource;

  void connectSocket() {
    dataSource = CoinDataSource();

    _cryptoService.connectSocket();
  }

  @override
  void onData(List<Coin>? data) {
    _logger.i("onData");
    super.onData(data);
    if (data != null) {
      coins = data;
      dataSource.updateDataGridSource(coins);
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
