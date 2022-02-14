import 'package:flutter/material.dart';

import '../../../../core/app/utils/constants.dart';

class WalletContainer extends StatelessWidget {
  final Widget child;
  const WalletContainer({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 225,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Constants.black2dp,
        boxShadow: Constants.shadow,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: child,
    );
  }
}
