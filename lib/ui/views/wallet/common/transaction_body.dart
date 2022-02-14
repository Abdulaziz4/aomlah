import 'package:aomlah/core/models/transactions.dart';
import 'package:aomlah/ui/views/wallet/common/blue_text.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/app/utils/constants.dart';

class TransactionBody extends StatelessWidget {
  final Transaction transaction;
  const TransactionBody({
    required this.transaction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String from = transaction.from;
    String to = transaction.to;
    String fees = transaction.satsToBTC(transaction.fees) + ' BTC ';

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: BlueText(
                  textAlign: TextAlign.right,
                  text: 'الرسوم',
                ),
              ),
              Expanded(
                child: Text(
                  '$fees',
                  textAlign: TextAlign.left,
                ),
              )
            ],
          ),
          Row(
            children: [
              BlueText(textAlign: TextAlign.right, text: 'من'),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  from,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: BlueText(textAlign: TextAlign.right, text: 'الى')),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  to,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
