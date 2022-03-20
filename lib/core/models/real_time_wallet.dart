import 'package:aomlah/core/models/transactions.dart';
import 'package:aomlah/core/models/realtime_wallet.dart';

class BtcRealTimeWallet extends RealTimeWallet {
  BtcRealTimeWallet({
    required String address,
    required int balance,
    List<Transaction>? transactions,
  }) : super(address: address, balance: balance, transactions: transactions);
  factory BtcRealTimeWallet.dummy() {
    return BtcRealTimeWallet(
      address: "",
      balance: 0,
    );
  }
  factory BtcRealTimeWallet.fromJson(Map<String, dynamic> json) {
    List<Transaction> transaction = [];
    transaction =
        (json["txs"] as List).map((e) => Transaction.fromJson(e)).toList();

    return BtcRealTimeWallet(
      address: json['address'],
      balance: json['balance'],
      transactions: transaction,
    );
  }

  double balanceSR(double price) {
    return double.parse((balanceBTC * price * 3.75).toStringAsFixed(3));
  }

  double get balanceBTC => (balance / 100000000);
}
