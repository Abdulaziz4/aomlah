import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/models/bank_account.dart';
import 'package:aomlah/ui/shared/bank_account_item.dart';
import 'package:flutter/material.dart';

class BankAccountCard extends StatelessWidget {
  final BankAccount bank;
  final void Function()? onDelete;
  final double? fontSize;
  const BankAccountCard({
    Key? key,
    required this.bank,
    this.onDelete,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BankAccountItem(
              bankName: bank.bankName,
              textStyle: Constants.mediumText.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                bank.ownerName,
                style: Constants.smallText,
              ),
            ),
            Text(
              bank.ibanLabel(),
              style: Constants.smallText,
            ),
          ],
        ),
        if (onDelete != null)
          IconButton(
            onPressed: onDelete,
            icon: Icon(
              Icons.delete_outline_rounded,
              color: Constants.redColor,
              size: 27,
            ),
          ),
      ],
    );
  }
}
