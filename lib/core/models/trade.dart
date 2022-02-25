import 'package:aomlah/core/enums/trade_state.dart';
import 'package:aomlah/core/models/bank_account.dart';

class Trade {
  final String tradeId;
  final double amount;
  final TradeStatus status;
  final String traderId;
  final String offerId;
  final BankAccount? bankAccount;

  Trade({
    required this.tradeId,
    required this.amount,
    required this.status,
    required this.traderId,
    required this.offerId,
    this.bankAccount,
  });
  factory Trade.fromJson(Map<String, dynamic> json) {
    return Trade(
      tradeId: json["trade_id"],
      amount: json["amount"],
      offerId: json["offer_id"],
      status: statusFromString(json["status"]),
      traderId: json["trader_id"],
      bankAccount: json["bank_account"] != null
          ? BankAccount.fromJson(json["bank_account"])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "trade_id": traderId,
      "amount": amount,
      "offer_id": offerId,
      "status": status.name,
      "trader_id": traderId,
      "bank_account": bankAccount == null ? null : bankAccount!.iban,
    };
  }

  static TradeStatus statusFromString(String status) {
    for (TradeStatus element in TradeStatus.values) {
      if (element.toString() == status) {
        return element;
      }
    }
    return TradeStatus.canceled;
  }
}
