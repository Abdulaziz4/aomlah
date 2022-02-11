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
  final bool offerType;
  final List<BankAccount>? bank;

  Offer({
    required this.offerID,
    required this.ownerID,
    required this.cryptoType ,
    required this.currencyType,
    required this.margin,
    required this.cryptoAmount,
    required this.minTrade,
    required this.terms,
    required this.offerType,
    this.bank
  });

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
    offerID: json['offer_id'],
    ownerID: json['owner_id'],
    cryptoType: json['crypto_type'],
    currencyType: json['currency_type'],
    margin: json['margin'],
    cryptoAmount: json['crypto_amount'],
    minTrade: json['min_trade'],
    terms: json['terms'],
    offerType: json['is_buy'],
    bank: json['bank'] ?? '',

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
    'is_buy': offerType,
    'bank': bank,
  };
}

}
