import 'package:aomlah/core/models/realtime_wallet.dart';
import 'package:aomlah/core/models/transactions.dart';

class UsdtRealTimeWallet extends RealTimeWallet {
  UsdtRealTimeWallet({
    required String address,
    required double balance,
    List<Transaction>? transactions,
  }) : super(address: address, balance: balance, transactions: transactions);

  factory UsdtRealTimeWallet.dummy() {
    return UsdtRealTimeWallet(
      address: "",
      balance: 0.0,
    );
  }
  factory UsdtRealTimeWallet.fromJson(Map<String, dynamic> json) {
    List<Transaction> transaction = [];
    // print(json['txs']);
    // transaction =
    //     (json["txs"] as List).map((e) => Transaction.fromJson(e)).toList();

    return UsdtRealTimeWallet(
      address: json['address'],
      balance: double.parse(json['balance']),
      transactions: transaction,
    );
  }
}
