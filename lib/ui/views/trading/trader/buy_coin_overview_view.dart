import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/ui/shared/rounded_input_field.dart';
import 'package:aomlah/ui/views/trading/components/spanned_text_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuyCoinOverviewView extends StatelessWidget {
  const BuyCoinOverviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("شراء BTC"),
      ),
      body: Column(
        children: [
          SpannedTextItem(
            rightText: "السعر",
            leftText: "144.134.13 ر.س",
          ),
          SpannedTextItem(
            rightText: "الكمية",
            leftText: "0.04151 BTC",
          ),
          SpannedTextItem(
            rightText: "الحد الادنى",
            leftText: "200 ر.س",
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Constants.black3dp,
            ),
            height: 200,
            child: Column(
              children: [RoundedInputField(label: "الكمية")],
            ),
          ),
        ],
      ),
    );
  }
}
