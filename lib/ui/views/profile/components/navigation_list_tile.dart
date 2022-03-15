import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationListTile extends StatelessWidget {
  final void Function() onPress;
  final String leadingIcon;
  final String title;

  const NavigationListTile(
      {Key? key,
      required this.onPress,
      required this.leadingIcon,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 2,
            color: Color(0xff3D4955),
          ),
          top: BorderSide(
            width: 2,
            color: Colors.black,
          ),
        ),
      ),
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(25.0),
          minimumSize: const Size.fromHeight(50),
          primary: Color(0xff0F1E2C),
          onPrimary: Colors.white,
        ),
        child: Row(
          children: <Widget>[
            SvgPicture.asset(leadingIcon),
            Container(width: 10),
            Text(title),
            Spacer(flex: 3),
            SvgPicture.asset("assets/icons/LeftArrow_Profile.svg"),
          ],
        ),
      ),
    );
  }
}
