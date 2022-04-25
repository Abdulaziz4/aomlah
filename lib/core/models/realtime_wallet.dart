import 'transactions.dart';

class RealTimeWallet {
  final String address;
  final double balance;
  List<Transaction>? transactions;

  RealTimeWallet({
    required this.address,
    required this.balance,
    this.transactions,
  });
}
