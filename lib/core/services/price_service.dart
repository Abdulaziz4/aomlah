import 'package:web_socket_channel/web_socket_channel.dart';

class PriceService {
  final api_key =
      "af86a1499b576f1fec8c58df5cfc702ca2cc714557bebd0f52a8b38752ea6335";
  final url = "wss://streamer.cryptocompare.com/v2";

  void connect() {
    final channel = WebSocketChannel.connect(
      Uri.parse('wss://echo.websocket.org'),
    );
  }
}
