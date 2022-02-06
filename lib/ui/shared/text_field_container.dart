import 'package:flutter/material.dart';


// الكلاس خاص ل المدخلات والستايل الخاص بها
class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, ),
      width: 286,
      height: 40,
      decoration: BoxDecoration(
        color: Color(0xFF0F1E2C),
        borderRadius: BorderRadius.circular(5),
      ),
      child: child,
    );
  }
}
