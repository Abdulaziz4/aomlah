import 'package:aomlah/core/models/realtime_wallet.dart';
import 'package:aomlah/core/models/transactions.dart';

class BatRealTimeWallet extends RealTimeWallet {
  BatRealTimeWallet({
    required String address,
    required double balance,
    List<Transaction>? transactions,
  }) : super(address: address, balance: balance, transactions: transactions);

  factory BatRealTimeWallet.dummy() {
    return BatRealTimeWallet(
      address: "",
      balance: 0.0,
    );
  }
  factory BatRealTimeWallet.fromJson(Map<String, dynamic> json) {
    List<Transaction> transaction = [];
    // print(json['txs']);
    // transaction =
    //     (json["txs"] as List).map((e) => Transaction.fromJson(e)).toList();

    return BatRealTimeWallet(
      address: json['address'],
      balance: double.parse(json['balance']),
      transactions: transaction,
    );
  }
}
