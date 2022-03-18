import 'package:aomlah/core/models/bitcoin.dart';
import 'package:aomlah/core/services/price_service.dart';

class BtcPriceService extends PriceService<Bitcoin> {

  @override
  Map<String, dynamic> connectionMessage() => {
        "action": "SubAdd",
        "subs": ["2~Binance~BTC~USDT"]
      };

  @override
  void sinkTicker(double price) {
    final bitcoin = Bitcoin(price);
    priceContrller.sink.add(bitcoin);
  }
}
