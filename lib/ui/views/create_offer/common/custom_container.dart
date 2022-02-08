import 'package:flutter/material.dart';

import '../../../../core/app/utils/constants.dart';

class CusContainer extends StatelessWidget {
  final Widget child;
  const CusContainer({Key? key,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Constants.black3dp,
        ),
        margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
        child: child
    );
  }
}
