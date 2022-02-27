import 'package:aomlah/core/models/transactions.dart';

class RealTimeWallet {
  final String address;
  final int balance;
  List<Transaction>? transactions;

  RealTimeWallet({
    required this.address,
    required this.balance,
    this.transactions,
  });
  factory RealTimeWallet.dummy() {
    return RealTimeWallet(
      address: "",
      balance: 0,
    );
  }
  factory RealTimeWallet.fromJson(Map<String, dynamic> json) {
    List<Transaction> transaction = [];
    transaction =
        (json["txs"] as List).map((e) => Transaction.fromJson(e)).toList();

    return RealTimeWallet(
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
