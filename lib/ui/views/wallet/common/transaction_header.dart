import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/enums/crypto_types.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/models/transactions.dart';

class TransactionHead extends StatelessWidget {
  final String address;
  final Transaction transaction;
  final CryptoTypes cryptoType;
  const TransactionHead({
    required this.transaction,
    required this.address,
    required this.cryptoType,
  });

  @override
  Widget build(BuildContext context) {
    final df = DateFormat('hh:mm:ss yyyy-MM-dd ');
    String date = df.format(transaction.confirmedDate);

    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              transactionType(),
              Text(
                '$date',
                textAlign: TextAlign.left,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'الكمية',
                textAlign: TextAlign.right,
                style: TextStyle(color: Constants.darkBlue),
              ),
              Text(
                transaction.convertToWholeCoin(transaction.total, cryptoType) +
                    cryptoText(cryptoType),
                textAlign: TextAlign.left,
              )
            ],
          )
        ],
      ),
    );
  }

  Text transactionType() {
    if (transaction.from == address) {
      return Text(
        'من محفظتك',
        textAlign: TextAlign.right,
        style: TextStyle(
          color: Colors.red,
        ),
      );
    } else {
      return Text(
        'الى محفظتك',
        textAlign: TextAlign.right,
        style: TextStyle(color: Constants.primaryColor),
      );
    }
  }

  String cryptoText(CryptoTypes cryptoType) {
    if (cryptoType == CryptoTypes.ethereum) {
      return ' ETH ';
    } else if (cryptoType == CryptoTypes.bitcoin) {
      return ' BTC';
    } else {
      return "";
    }
  }
}
