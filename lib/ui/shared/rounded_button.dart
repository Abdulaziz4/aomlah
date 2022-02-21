import 'package:flutter/material.dart';

// الكلاس هـذا متعلق بالازرار والكلام اللي فيها والستايل المتعلق بها
class RoundedButton extends StatelessWidget {
  static const kPrimaryColor = Color(0xFF169c94);

  final String text;
  final VoidCallback press;
  TextStyle? textStyle;
  final Color color, textColor;
  RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.textStyle,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: 216,
      height: 44,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          7,
        ),
        child: newElevatedButton(),
      ),
    );
  }

  //Used:ElevatedButton as FlatButton is deprecated.
  //Here we have to apply customizations to Button by inheriting the styleFrom

  Widget newElevatedButton() {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
        ),
      ),
      onPressed: press,
      style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          primary: color,
          padding: EdgeInsets.symmetric(
            horizontal: 40,
          ),
          textStyle: textStyle ??
              TextStyle(
                  color: textColor, fontSize: 14, fontWeight: FontWeight.w500)),
    );
  }
}
