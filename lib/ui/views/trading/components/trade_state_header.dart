import 'package:aomlah/core/app/utils/constants.dart';
import 'package:flutter/material.dart';

class TradeStateHeader extends StatelessWidget {
  final String title;
  final Widget? subWidget;
  final Color color;
  const TradeStateHeader({
    Key? key,
    required this.title,
    required this.color,
    this.subWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderStyle {
  final String title;
  final Widget subTitle;
  final Color color;

  HeaderStyle(this.title, this.subTitle, this.color);
}
