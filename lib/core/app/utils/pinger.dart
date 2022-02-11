import 'dart:async';
import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';

class Pinger {
  static void Function() ping(
      WebSocketChannel channel, Map<String, dynamic> ping) {
    Timer pingtimer = Timer.periodic(Duration(seconds: 10), (timer) {
      channel.sink.add(jsonEncode(ping));
    });

    return pingtimer.cancel;
  }
}
