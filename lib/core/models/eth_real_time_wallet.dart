import 'package:aomlah/core/models/transactions.dart';
import 'package:aomlah/core/models/realtime_wallet.dart';

class EthRealTimeWallet extends RealTimeWallet {
  EthRealTimeWallet({
    required String address,
    required double balance,
    List<Transaction>? transactions,
  }) : super(address: address, balance: balance, transactions: transactions);

  factory EthRealTimeWallet.dummy() {
    return EthRealTimeWallet(
      address: "",
      balance: 0.0,
    );
  }
  factory EthRealTimeWallet.fromJson(Map<String, dynamic> json) {
    List<Transaction> transaction = [];

    return EthRealTimeWallet(
      address: json['address'],
      balance: double.parse(json['balance']),
      transactions: transaction,
    );
  }
}
