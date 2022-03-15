import 'dart:convert';

import 'package:aomlah/core/app/utils/currency_helper.dart';

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
    return CurrencyHelper.fiatAmountToBtc(
      fiatAmount: fiatAmount,
      price: price,
    );
  }

  double priceFromMargin(double margin) {
    return price * (margin / 100) * 3.75;
  }
}
