import 'package:uuid/uuid.dart';

class UuidHelper {
  static String generate() {
    var uuid = Uuid();
    return uuid.v4();
  }
}