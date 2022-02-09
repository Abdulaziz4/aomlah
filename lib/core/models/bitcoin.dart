import 'dart:convert';

import 'package:aomlah/core/app/utils/double_extension.dart';

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
}
