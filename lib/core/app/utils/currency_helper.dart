abstract class CurrencyHelper {
  // Convert BTC to Satoshi
  static int btcToSat(double btc) {
    return (btc * 100000000).toInt();
  }

  static double satsToBtc(int sats) {
    return sats * 0.00000001;
  }

  // Calculates the amount you will get in BTC
  static double fiatAmountToBtc({
    required double fiatAmount,
    required double price,
  }) {
    return (fiatAmount / 3.75) / price;
  }

  // Calculates the amount you will get in BTC
  static double btcToFiat({
    required double btcAmount,
    required double price,
  }) {
    return (btcAmount * price * 3.75);
  }
}
