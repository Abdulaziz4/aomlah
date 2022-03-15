import 'package:aomlah/ui/views/trading/components/spanned_text_item.dart';
import 'package:flutter/material.dart';

class TradeOverviewHeader extends StatelessWidget {
  final String price;
  final String quantity;
  final double minLimit;
  const TradeOverviewHeader(
      {Key? key,
      required this.price,
      required this.quantity,
      required this.minLimit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SpannedTextItem(
          rightText: "السعر",
          leftText: "$price ر.س",
        ),
        SpannedTextItem(
          rightText: "الكمية",
          leftText: quantity,
        ),
        SpannedTextItem(
          rightText: "الحد الادنى",
          leftText: "$minLimit ر.س",
        ),
      ],
    );
  }
}
