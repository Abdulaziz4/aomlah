import 'package:aomlah/core/app/utils/constants.dart';
import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  final String amount;
  final String label;
  final Color color;
  final IconData icon;
  const SummaryCard({
    Key? key,
    required this.amount,
    required this.color,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: Constants.black4dp.withOpacity(0.75),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  amount,
                  style: TextStyle(fontSize: 29),
                  maxLines: 1,
                ),
                Text(
                  label,
                  style: Constants.smallText,
                ),
              ],
            ),
          ),
          Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color.withOpacity(0.3),
              ),
              child: Icon(
                icon,
                size: 35,
                color: color,
              )),
        ],
      ),
    );
  }
}
