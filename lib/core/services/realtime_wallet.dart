import '../models/transactions.dart';

class RealTimeWallet {
  final String address;
  final int balance;
  List<Transaction>? transactions;

  RealTimeWallet({
    required this.address,
    required this.balance,
    this.transactions,
  });
}
