import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/app/utils/form_validator.dart';
import 'package:aomlah/ui/shared/busy_overlay.dart';
import 'package:aomlah/ui/shared/rounded_input_field.dart';
import 'package:aomlah/ui/views/chat/viewmodels/chat_viewmodel.dart';
import 'package:flutter/material.dart';
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
    Color receiverColor = Color(0xFFE8E8EE);
    Color senderColor = Color(0xFF1B97F3);
    return ViewModelBuilder<ChatViewModel>.reactive(
      viewModelBuilder: () => ChatViewModel(tradeId),
      builder: (BuildContext context, ChatViewModel viewmodel, _) =>
          BusyOverlay(
        isBusy: viewmodel.isBusy,
        child: Scaffold(
          appBar: AppBar(
            title: Text("المحادثة"),
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      children: viewmodel.messages
                          .map(
                            (message) => Padding(
                              padding: const EdgeInsets.only(bottom: 3.0),
                              child: BubbleSpecialThree(
                                text: message.content,
                                color: viewmodel
                                        .isCurrentUserSender(message.senderId)
                                    ? senderColor
                                    : receiverColor,
                                isSender: viewmodel
                                    .isCurrentUserSender(message.senderId),
                                textStyle: viewmodel
                                        .isCurrentUserSender(message.senderId)
                                    ? Constants.smallText
                                    : Constants.smallText
                                        .copyWith(color: Colors.black),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
              Form(
                key: viewmodel.formKey,
                child: Container(
                    color: Constants.black2dp,
                    padding: EdgeInsets.only(
                      top: 5,
                      left: 10,
                      right: 10,
                      bottom: 20,
                    ),
                    //height: 70,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: RoundedInputField(
                            label: "",
                            hintText: "رسالتك",
                            validator: FormValidator.hasValue,
                            onSave: viewmodel.setCurrentMessage,
                          ),
                        ),
                        Material(
                          type: MaterialType.transparency,
                          shape: CircleBorder(),
                          clipBehavior: Clip.hardEdge,
                          child: IconButton(
                            onPressed: viewmodel.sendMessage,
                            icon: Icon(Icons.send),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
