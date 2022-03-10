import 'package:aomlah/core/models/real_time_wallet.dart';
import 'package:aomlah/core/models/transactions.dart';
import 'package:aomlah/core/services/realtime_wallet.dart';

class EthRealTimeWallet extends RealTimeWallet {
  EthRealTimeWallet({
    required String address,
    required int balance,
    List<Transaction>? transactions,
  }) : super(address: address, balance: balance, transactions: transactions);

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
