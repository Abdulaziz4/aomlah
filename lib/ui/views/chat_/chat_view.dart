import 'package:aomlah/core/app/app.dart';
import 'package:aomlah/ui/shared/rounded_input_field.dart';
import 'package:aomlah/ui/shared/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("المحادثة"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 70,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            color: Color(0xff0F1E2C),
            child: Row(
              children: <Widget>[
                SvgPicture.asset(
                  "assets/icons/ProfilePic.svg",
                  height: 50,
                  width: 50,
                ),
                Container(width: 20),
                Text("زياد أحمد"),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: BubbleSpecialThree(
                text: 'Added iMassage shape bubbles',
                color: Color(0xFF1B97F3),
                tail: false,
                textStyle: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          RoundedInputField(
            label: "",
            hintText: "رسالتك",
            suffix: SvgPicture.asset("assets/icons/Send_Arrow_Icon.svg"),
          )
        ],
      ),
    );
  }
}
