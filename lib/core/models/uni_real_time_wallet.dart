import 'package:aomlah/core/models/realtime_wallet.dart';
import 'package:aomlah/core/models/transactions.dart';

class UniRealTimeWallet extends RealTimeWallet {
  UniRealTimeWallet({
    required String address,
    required double balance,
    List<Transaction>? transactions,
  }) : super(address: address, balance: balance, transactions: transactions);

  factory UniRealTimeWallet.dummy() {
    return UniRealTimeWallet(
      address: "",
      balance: 0.0,
    );
  }
  factory UniRealTimeWallet.fromJson(Map<String, dynamic> json) {
    List<Transaction> transaction = [];
    // print(json['txs']);
    // transaction =
    //     (json["txs"] as List).map((e) => Transaction.fromJson(e)).toList();

    return UniRealTimeWallet(
      address: json['address'],
      balance: double.parse(json['balance']),
      transactions: transaction,
    );
  }
}
