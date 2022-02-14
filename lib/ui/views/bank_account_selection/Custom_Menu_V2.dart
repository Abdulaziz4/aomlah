import 'package:aomlah/core/app/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomMenuV2 extends StatelessWidget {
  final DropdownButton dropdownButton;
  final EdgeInsetsGeometry? menuMargin;
  const CustomMenuV2(
      {Key? key, required this.dropdownButton, required this.menuMargin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Constants.black3dp,
        ),
        margin: menuMargin,
        //padding: EdgeInsets.symmetric(vertical: 0, horizontal: 7),
        child: DropdownButtonHideUnderline(child: dropdownButton));
  }
}
