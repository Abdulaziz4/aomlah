import 'package:aomlah/core/enums/trade_state.dart';
import 'package:aomlah/core/models/bank_account.dart';
import 'package:aomlah/core/models/offer.dart';
import 'package:aomlah/core/models/wallet.dart';

class Trade {
  final String tradeId;
  final double amount;
  final double price;
  final TradeStatus status;
  final String traderId;
  final String offerId;
  final String? bankIban;

  final Offer? offer;
  final BankAccount? bankAccount;
  final String? traderName;
  final Wallet? traderWallet;

  final DateTime? createdAt;
  Trade({
    required this.tradeId,
    required this.amount,
    required this.status,
    required this.traderId,
    required this.offerId,
    required this.price,
    this.bankAccount,
    this.bankIban,
    this.offer,
    this.traderName,
    this.createdAt,
    this.traderWallet,
  });
  factory Trade.fromJson(Map<String, dynamic> json) {
    return Trade(
      tradeId: json["trade_id"],
      amount: json["amount"] * 1.0,
      offerId: json["offer_id"],
      status: statusFromString(json["status"]),
      traderId: json["trader_id"],
      bankAccount: json["bank_account"] != null
          ? BankAccount.fromJson(json["bank_account"])
          : null,
      bankIban: json["bank_iban"],
      offer: json["offer"] == null ? null : Offer.fromJson(json["offer"]),
      traderName: json["name"],
      price: json["price"] * 1.0,
      createdAt: DateTime.tryParse(json["created_at"]),
      traderWallet: Wallet.fromJson(json["trader_wallet"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "trade_id": tradeId,
      "amount": amount,
      "offer_id": offerId,
      "status": status.name,
      "trader_id": traderId,
      "bank_iban": bankAccount == null ? null : bankAccount!.iban,
      "price": price,
    };
  }

  static TradeStatus statusFromString(String status) {
    for (TradeStatus element in TradeStatus.values) {
      if (element.name == status) {
        return element;
      }
    }
    return TradeStatus.canceled;
  }
}
