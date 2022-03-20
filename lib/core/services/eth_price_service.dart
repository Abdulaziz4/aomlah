import 'package:aomlah/core/app/api_keys.dart';
import 'package:aomlah/core/models/ethereum.dart';
import 'package:aomlah/core/services/price_service.dart';

class EthPriceService extends PriceService<Ethereum> {
  @override
  final String apiKey = APIKeys.cryptoCompKeyEth;

  @override
  Map<String, dynamic> connectionMessage() => {
        "action": "SubAdd",
        "subs": ["2~Binance~ETH~USDT"]
      };

  @override
  void sinkTicker(double price) {
    final ethereum = Ethereum(price);
    priceContrller.sink.add(ethereum);
  }
}
