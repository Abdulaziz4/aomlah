import 'package:aomlah/core/models/bank_account.dart';
import 'package:aomlah/core/models/wallet.dart';

class Offer {
  final String offerID;
  final String ownerID;
  final String cryptoType;
  final String currencyType;
  final double margin;
  final double totalQuantity;
  final double remainingQuantity;

  final double minTrade;
  final String terms;

  ///BUY OFFER= TRUE, SELL OFFER= False
  final bool isBuy;
  final List<BankAccount>? bankAccounts;
  final String? ownerName;
  final DateTime? createAt;
  final Wallet? ownerWallet;
  final double ownerDebt;

  Offer({
    required this.offerID,
    required this.ownerID,
    required this.cryptoType,
    required this.currencyType,
    required this.margin,
    required this.totalQuantity,
    required this.minTrade,
    required this.terms,
    required this.isBuy,
    required this.remainingQuantity,
    this.bankAccounts,
    this.createAt,
    this.ownerName,
    this.ownerWallet,
    this.ownerDebt = 0,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    List<BankAccount> accounts = [];
    if (json["bank_accounts"] != null &&
        (json["bank_accounts"] as List).first != null) {
      accounts = (json["bank_accounts"] as List).map((e) {
        return BankAccount.fromJson(e);
      }).toList();
    }
    return Offer(
      offerID: json['offer_id'],
      ownerID: json['owner_id'],
      cryptoType: json['crypto_type'],
      currencyType: json['currency_type'],
      margin: json['margin'] * 1.0,
      totalQuantity: json['total_quantity'] * 1.0,
      remainingQuantity: json['remaining_quantity'] * 1.0,
      minTrade: json['min_trade'] * 1.0,
      terms: json['terms'],
      isBuy: json['is_buy'],
      bankAccounts: accounts,
      ownerName: json["name"],
      createAt: DateTime.parse(json["created_at"]),
      ownerWallet: json["owner_wallet"] != null
          ? Wallet.fromJson(json["owner_wallet"])
          : null,
      ownerDebt: json["owner_debt"] == null ? 0.0 : json["owner_debt"] * 1.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'offer_id': offerID,
      'owner_id': ownerID,
      'crypto_type': cryptoType,
      'currency_type': currencyType,
      'margin': margin,
      'total_quantity': totalQuantity,
      'remaining_quantity': remainingQuantity,
      'min_trade': minTrade,
      'terms': terms,
      'is_buy': isBuy,
    };
  }

  // Accomadte different POV for isBuy variable
  bool get isBuyTrader => !isBuy;
  bool get isBuyMarchent => isBuy;

  String totalQuantityLabel() {
    return "⠀" + totalQuantity.toString() + " BTC";
  }

  String remainingQuantityLabel() {
    return "⠀" + totalQuantity.toString() + " BTC";
  }
}
