import 'package:aomlah/core/models/transactions.dart';

class EthRealTimeWallet {
  final String address;
  final int balance;
  List<Transaction>? transactions;

  EthRealTimeWallet({
    required this.address,
    required this.balance,
    this.transactions,
  });
  factory EthRealTimeWallet.dummy() {
    return EthRealTimeWallet(
      address: "",
      balance: 0,
    );
  }
  factory EthRealTimeWallet.fromJson(Map<String, dynamic> json) {
    List<Transaction> transaction = [];
    print(json['txs']);
    transaction =
        (json["txs"] as List).map((e) => Transaction.fromJson(e)).toList();

    return EthRealTimeWallet(
      address: json['address'],
      balance: json['balance'],
      transactions: transaction,
    );
  }
}
