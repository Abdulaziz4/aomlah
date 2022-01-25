import 'package:firebase_core/firebase_core.dart';
import 'package:stacked/stacked.dart';

class StartupViewModel extends BaseViewModel {
  Future<void> initApp() async {
    await Firebase.initializeApp();
  }
}
