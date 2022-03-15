import 'package:aomlah/core/app/utils/colors_helper.dart';
import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/ui/shared/custom_button.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:flutter/material.dart';

class BottomActions extends StatelessWidget {
  final void Function() onCancel;
  final void Function() onPaymentSent;
  final void Function() onPaymentReceived;
  final void Function() onOpenDispute;
  final bool showCancelButton;
  final bool showPaymentSent;
  final bool showOpenDispute;
  final bool showCompleteTrade;

  const BottomActions(
      {Key? key,
      required this.onCancel,
      required this.onPaymentSent,
      required this.onPaymentReceived,
      required this.onOpenDispute,
      required this.showCancelButton,
      required this.showPaymentSent,
      required this.showOpenDispute,
      required this.showCompleteTrade})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return showNothing()
        ? SizedBox()
        : Container(
            height: 100,
            width: double.infinity,
            padding: const EdgeInsets.only(
              left: 15,
              bottom: 15,
              right: 15,
            ),
            color: darken(Constants.black2dp, 20),
            child: Row(
              children: [
                if (showPaymentSent)
                  Expanded(
                    flex: 2,
                    child: CustomButton(
                      onPressed: onPaymentSent,
                      text: "تم التحويل، أخبر البائع",
                      height: 45,
                    ),
                  ),
                if (showPaymentSent) SizedBox(width: 10),
                if (showCancelButton)
                  Expanded(
                    child: CustomButton(
                      onPressed: onCancel,
                      text: "الغاء",
                      color: Constants.redColor,
                      height: 45,
                    ),
                  ),
                if (showCompleteTrade)
                  Expanded(
                    child: CustomButton(
                      onPressed: onPaymentReceived,
                      text: "تأكيد",
                      color: Constants.primaryColor,
                      height: 45,
                    ),
                  ),
                if (showCompleteTrade) SizedBox(width: 10),
                if (showOpenDispute)
                  Expanded(
                    child: CustomButton(
                      onPressed: onOpenDispute,
                      text: "رفع طلب نزاع",
                      color: Constants.redColor,
                      height: 45,
                    ),
                  ),
              ],
            ),
          );
  }

  bool showNothing() =>
      !showCancelButton &&
      !showCompleteTrade &&
      !showPaymentSent &&
      !showOpenDispute;
}
