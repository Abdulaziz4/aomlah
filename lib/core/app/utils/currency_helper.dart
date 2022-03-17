abstract class CurrencyHelper {
  // Convert BTC to Satoshi
  static int btcToSat(double btc) {
    return (btc * 100000000).toInt();
  }

  static double satsToBtc(int sats) {
    return sats * 0.00000001;
  }

  static double weiToETH(int wei) {
    return (wei / 1000000000000000000.0);
  }

  // Calculates the amount you will get in BTC
  static double fiatAmountToCoin({
    required double fiatAmount,
    required double price,
  }) {
    return (fiatAmount / 3.75) / price;
  }

  static double usdToSR(double usd) {
    return usd * 3.75;
  }

  static double srToUsd(double sr) {
    return sr / 3.75;
  }

  // Calculates the amount you will get in BTC
  static double btcToFiat({
    required double btcAmount,
    required double price,
  }) {
    return (btcAmount * price * 3.75);
  }
}
