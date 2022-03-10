import 'dart:convert';


class PriceTicker {
  final double price;

  PriceTicker(this.price);

  Map<String, dynamic> toMap() {
    return {
      'price': price,
    };
  }

  factory PriceTicker.fromMap(Map<String, dynamic> map) {
    return PriceTicker(
      map['price'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PriceTicker.fromJson(String source) => PriceTicker.fromMap(json.decode(source));


}
