import 'package:rxdart/rxdart.dart';

import 'package:aomlah/core/app/logger.dart';
import 'package:aomlah/core/models/aomlah_user.dart';

class UserService {
  late AomlahUser user;

  final _logger = getLogger("UserService");

  BehaviorSubject<AomlahUser> userController = BehaviorSubject<AomlahUser>();

  void updateUser(AomlahUser user) {
    _logger.i("updateUser | user=${user.toString()}");

    this.user = user;
    userController.add(user);
  }
}
