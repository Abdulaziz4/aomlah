import 'package:aomlah/core/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/logger.dart';
import 'package:aomlah/core/services/supabase_service.dart';
import 'package:aomlah/core/models/chat_message.dart';

class ChatViewModel extends StreamViewModel<List<ChatMessage>> {
  final String tradeId;
  ChatViewModel(this.tradeId);

  final formKey = GlobalKey<FormState>();

  final _logger = getLogger("ChatViewModel");

  final _userService = locator<UserService>();
  final _suabaseService = locator<SupabaseService>();

  String? currentMessage;

  List<ChatMessage> messages = [];

  void sendMessage() {
    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    formKey.currentState!.save();

    final message = ChatMessage(
      content: currentMessage!,
      senderId: _userService.user.profileId,
      tradeId: tradeId,
    );
    _suabaseService.createChatMessgae(message);

    formKey.currentState!.reset();
  }

  void setCurrentMessage(String? value) {
    currentMessage = value;
  }

  bool isCurrentUserSender(String senderId) {
    return senderId == _userService.user.profileId;
  }

  @override
  void onSubscribed() {
    super.onSubscribed();
    _logger.i("Subscribed to Realtime Chat");
    setBusy(true);
  }

  @override
  void onData(List<ChatMessage>? data) {
    super.onData(data);
    setBusy(false);
    _logger.i("onData");

    if (data != null) {
      messages = data.toList();
    }
  }

  @override
  void onError(error) {
    super.onError(error);
    _logger.e("An Error Occured $error");
    setBusy(false);
  }

  @override
  Stream<List<ChatMessage>> get stream => _suabaseService.getTradeChatStream(
        tradeId,
      );
}
