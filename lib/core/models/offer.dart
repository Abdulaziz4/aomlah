import 'package:aomlah/core/models/bank_account.dart';

class Offer {
  final String offerID;
  final String ownerID;
  final String cryptoType;
  final String currencyType;
  final double margin;
  final double cryptoAmount;
  final double minTrade;
  final String terms;

  ///BUY OFFER= TRUE, SELL OFFER= False
  final bool isBuy;
  final List<BankAccount>? bank;

  Offer(
      {required this.offerID,
      required this.ownerID,
      required this.cryptoType,
      required this.currencyType,
      required this.margin,
      required this.cryptoAmount,
      required this.minTrade,
      required this.terms,
      required this.isBuy,
      this.bank});

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        offerID: json['offer_id'],
        ownerID: json['owner_id'],
        cryptoType: json['crypto_type'],
        currencyType: json['currency_type'],
        margin: json['margin'] * 1.0,
        cryptoAmount: json['crypto_amount'] * 1.0,
        minTrade: json['min_trade'] * 1.0,
        terms: json['terms'],
        isBuy: json['is_buy'],
        // bank: json['bank'] ?? '',
      );

  Map<String, dynamic> toJson() {
    return {
      'offer_id': offerID,
      'owner_id': ownerID,
      'crypto_type': cryptoType,
      'currency_type': currencyType,
      'margin': margin,
      'crypto_amount': cryptoAmount,
      'min_trade': minTrade,
      'terms': terms,
      'is_buy': isBuy,
      // 'bank': bank,
    };
  }

  String cryptoAmonutLabel() {
    return "ㅤ" + cryptoAmount.toString() + " BTC";
  }
}
