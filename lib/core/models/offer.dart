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
  final bank;

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
    cryptoType: json['cryptoType'],
    currencyType: json['currencyType'],
    margin: json['margin'],
    cryptoAmount: json['cryptoAmount'],
    minTrade: json['minTrade'],
    terms: json['terms'],
    offerType: json['isBuy'],
    bank: json['bank'] ?? '',

  );


  Map<String, dynamic> toJson() {
  return {
    'offer_id': offerID,
    'owner_id': ownerID,
    'cryptoType': cryptoType,
    'currencyType': currencyType,
    'margin': margin,
    'cryptoAmount': cryptoAmount,
    'minTrade': minTrade,
    'terms': terms,
    'isBuy': offerType,
    'bank': bank,
  };
}

}
