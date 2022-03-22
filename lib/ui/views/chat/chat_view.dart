import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/ui/shared/rounded_input_field.dart';
import 'package:aomlah/ui/views/chat/viewmodels/chat_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:stacked/stacked.dart';

class ChatView extends StatelessWidget {
  final String tradeId;
  const ChatView({
    Key? key,
    required this.tradeId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatViewModel>.reactive(
      viewModelBuilder: () => ChatViewModel(tradeId),
      builder: (BuildContext context, ChatViewModel viewmodel, _) => Scaffold(
        appBar: AppBar(
          title: Text("المحادثة"),
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 70,
              padding: EdgeInsets.all(5),
              color: Constants.black2dp,
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
              child: SingleChildScrollView(
                child: Column(
                  children: const <Widget>[
                    BubbleSpecialThree(
                      text: 'Added iMassage shape bubbles',
                      color: Color(0xFF1B97F3),
                      tail: false,
                      textStyle: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    BubbleSpecialThree(
                      text: 'Please try and give some feedback on it!',
                      color: Color(0xFF1B97F3),
                      tail: true,
                      textStyle: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    BubbleSpecialThree(
                      text: 'Sure',
                      color: Color(0xFFE8E8EE),
                      tail: false,
                      isSender: false,
                    ),
                    BubbleSpecialThree(
                      text: "I tried. It's awesome!!!",
                      color: Color(0xFFE8E8EE),
                      tail: false,
                      isSender: false,
                    ),
                    BubbleSpecialThree(
                      text: "Thanks",
                      color: Color(0xFFE8E8EE),
                      tail: true,
                      isSender: false,
                    ),
                    BubbleSpecialThree(
                      text: 'Added iMassage shape bubbles',
                      color: Color(0xFF1B97F3),
                      tail: false,
                      textStyle: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    BubbleSpecialThree(
                      text: 'Please try and give some feedback on it!',
                      color: Color(0xFF1B97F3),
                      tail: true,
                      textStyle: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    BubbleSpecialThree(
                      text: 'Sure',
                      color: Color(0xFFE8E8EE),
                      tail: false,
                      isSender: false,
                    ),
                    BubbleSpecialThree(
                      text: "I tried. It's awesome!!!",
                      color: Color(0xFFE8E8EE),
                      tail: false,
                      isSender: false,
                    ),
                    BubbleSpecialThree(
                      text: "Thanks",
                      color: Color(0xFFE8E8EE),
                      tail: true,
                      isSender: false,
                    ),
                    BubbleSpecialThree(
                      text: 'Added iMassage shape bubbles',
                      color: Color(0xFF1B97F3),
                      tail: false,
                      textStyle: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    BubbleSpecialThree(
                      text: 'Please try and give some feedback on it!',
                      color: Color(0xFF1B97F3),
                      tail: true,
                      textStyle: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    BubbleSpecialThree(
                      text: 'Sure',
                      color: Color(0xFFE8E8EE),
                      tail: false,
                      isSender: false,
                    ),
                    BubbleSpecialThree(
                      text: "I tried. It's awesome!!!",
                      color: Color(0xFFE8E8EE),
                      tail: false,
                      isSender: false,
                    ),
                    BubbleSpecialThree(
                      text: "Thanks",
                      color: Color(0xFFE8E8EE),
                      tail: true,
                      isSender: false,
                    )
                  ],
                ),
              ),
            ),
            Container(
                color: Constants.black2dp,
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                //height: 70,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: RoundedInputField(
                        label: "",
                        hintText: "رسالتك",
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon:
                          SvgPicture.asset("assets/icons/Send_Arrow_Icon.svg"),
                      padding: EdgeInsets.only(right: 5),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
