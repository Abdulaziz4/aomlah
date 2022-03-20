import 'package:aomlah/core/enums/crypto_types.dart';

import '../app/utils/currency_helper.dart';

class Transaction {
  final String from;
  final String to;
  final int total;
  final int fees;
  final DateTime confirmedDate;

  Transaction({
    required this.from,
    required this.to,
    required this.total,
    required this.fees,
    required this.confirmedDate,
  });
  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      from: (((json['inputs'] as List)[0]['addresses'] as List))[0],
      to: (((json['outputs'] as List)[0]['addresses'] as List))[0],
      total: ((json['outputs'] as List)[0])['value'],
      fees: json['fees'],
      confirmedDate:
          DateTime.parse(json['confirmed'] ?? DateTime(0).toString()),
    );
  }

  String convertToWholeCoin(int total, CryptoTypes types) {
    if (types == CryptoTypes.bitcoin) {
      return CurrencyHelper.satsToBtc(total).toString();
    } else if (types == CryptoTypes.ethereum) {
      return CurrencyHelper.weiToETH(total).toString();
    } else {
      return "Cant Convert";
    }
  }
}
