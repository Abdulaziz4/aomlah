import 'dart:convert';
import 'dart:developer' as developer;

import 'package:logger/logger.dart';

class JsonLogger {
  static const JsonDecoder decoder = JsonDecoder();
  static const JsonEncoder encoder = JsonEncoder.withIndent('   ');

  static void prettyPrintJson(dynamic input) {
    var prettyString = encoder.convert(input);
    _log(prettyString);
  }

  static void _log(String message) {
    developer.log(message, name: '☁️ API Service');
  }
}

Logger getLogger(String className) {
  return Logger(
    // printer: CustomLogPrinter(className),
    printer: CustomLogPrinter(className),
  );
}

class CustomLogPrinter extends LogPrinter {
  final String className;
  CustomLogPrinter(this.className) : super();

  @override
  List<String> log(LogEvent event) {
    String emoji = PrettyPrinter.levelEmojis[event.level]!;
    return [('$emoji [$className]: ${event.message}')];
  }
}
