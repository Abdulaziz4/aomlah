import 'package:aomlah/core/app/utils/currency_helper.dart';
import 'package:aomlah/core/models/price_ticker.dart';

class Ethereum extends PriceTicker {
  Ethereum(double price) : super(price);

  // Calculates the amount you will get in BTC
  double amountToEth(double fiatAmount) {
    return CurrencyHelper.fiatAmountToEth(
      fiatAmount: fiatAmount,
      price: price,
    );
  }

  double priceFromMargin(double margin) {
    return price * (margin / 100) * 3.75;
  }
}
