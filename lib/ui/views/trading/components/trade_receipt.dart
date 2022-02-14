import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/ui/views/trading/components/receipt_info.dart';
import 'package:flutter/material.dart';

class TradeReceipt extends StatelessWidget {
  final bool isBuy;
  final String quantity;
  final String price;
  final String cryptoAmount;
  const TradeReceipt(
      {Key? key,
      required this.isBuy,
      required this.quantity,
      required this.price,
      required this.cryptoAmount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.black2dp,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      child: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Text(
                    isBuy ? "شراء" : "بيع",
                    style: Constants.largeText.copyWith(
                      color:
                          isBuy ? Constants.primaryColor : Constants.redColor,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text("BTC", style: Constants.largeText),
                ],
              ),
              RecipteInfoItem(
                rightText: "المبلغ الاجمالي",
                leftText: "$quantity ر.س",
              ),
              RecipteInfoItem(
                rightText: "السعر",
                leftText: "$price ر.س",
              ),
              RecipteInfoItem(
                rightText: "كمية العملة الرقمية",
                leftText: "$cryptoAmount BTC",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
