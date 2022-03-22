class ChatMessage {
  final String? messageId;
  final String content;
  final String senderId;
  final String tradeId;
  ChatMessage({
    this.messageId,
    required this.content,
    required this.senderId,
    required this.tradeId,
  });

  ChatMessage copyWith({
    String? messageId,
    String? content,
    String? senderId,
    String? tradeId,
  }) {
    return ChatMessage(
      messageId: messageId ?? this.messageId,
      content: content ?? this.content,
      senderId: senderId ?? this.senderId,
      tradeId: tradeId ?? this.tradeId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'senderId': senderId,
      'tradeId': tradeId,
    };
  }

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      messageId: json['message_id'],
      content: json['content'] ?? '',
      senderId: json['sender_id'] ?? '',
      tradeId: json['trade_id'] ?? '',
    );
  }
}
