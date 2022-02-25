import 'dart:convert';

class Bitcoin {
  final double price;

  Bitcoin(this.price);

  Map<String, dynamic> toMap() {
    return {
      'price': price,
    };
  }

  factory Bitcoin.fromMap(Map<String, dynamic> map) {
    return Bitcoin(
      map['price'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Bitcoin.fromJson(String source) =>
      Bitcoin.fromMap(json.decode(source));

  // Calculates the amount you will get in BTC
  double amountToBtc(double fiatAmount) {
    return (fiatAmount / 3.75) / price;
  }

  double priceFromMargin(double margin) {
    return price * (margin / 100) * 3.75;
  }
}
