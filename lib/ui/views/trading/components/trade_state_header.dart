import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/enums/dispute_status.dart';
import 'package:aomlah/core/models/dispute.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class TradeStateHeader extends StatelessWidget {
  final String title;
  final Widget? subWidget;
  final Color color;
  final Dispute? dispute;
  const TradeStateHeader({
    Key? key,
    required this.title,
    required this.color,
    this.subWidget,
    this.dispute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      decoration: BoxDecoration(
        boxShadow: Constants.shadow,
        color: color,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close_rounded, size: 30),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Constants.robotoFont.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  subWidget ?? SizedBox(),
                  if (dispute != null) buildDispute(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDispute() {
    String text = "";

    if (dispute!.status == DisputeStatus.waiting) {
      text = "حالة النزاع في الانتظار وتم اخر تحديث في";
      final updatedAt = intl.DateFormat.yMd()
          .add_jm()
          .format(dispute!.updatedAt ?? DateTime.now());
      text += " \n$updatedAt";
    } else {
      text = "تم حل النزاع";
    }
    return Text(text);
  }
}

class HeaderStyle {
  final String title;
  final Widget subTitle;
  final Color color;

  HeaderStyle(this.title, this.subTitle, this.color);
}
