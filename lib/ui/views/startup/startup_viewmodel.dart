import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/app.router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navService = locator<NavigationService>();

  Future<void> initApp() async {
    await Firebase.initializeApp();

    _navService.navigateTo(Routes.navigationView);
  }
}
