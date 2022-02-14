import 'package:flutter/material.dart';

class ConversionButton extends StatelessWidget {
  static const kPrimaryColor = Color(0xFF169c94);

  final String text;
  final VoidCallback press;
  final Color color, textColor;
  const ConversionButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: 160,
      height: 35,
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
          textStyle: TextStyle(
              color: textColor, fontSize: 17, fontWeight: FontWeight.bold)),
    );
  }
}
