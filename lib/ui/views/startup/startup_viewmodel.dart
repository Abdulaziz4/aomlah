import 'package:aomlah/core/services/auth_service.dart';
import 'package:aomlah/core/services/candles_service.dart';
import 'package:aomlah/core/services/price_service.dart';
import 'package:aomlah/core/services/realtime_wallet_service.dart';
import 'package:aomlah/core/services/wallet_managment_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/app.router.dart';
import 'package:aomlah/firebase_options.dart';

class StartupViewModel extends BaseViewModel {
  Future<void> initApp() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await setupLocator();

    final _priceService = locator<PriceService>();
    _priceService.connect();

    final _navService = locator<NavigationService>();
    final _authService = locator<AuthService>();

    if (_authService.isUserLoggedIn()) {
      await _authService.setUser();
      _navService.navigateTo(Routes.navigationView);
    } else {
      _navService.navigateTo(Routes.welcomeView);
    }
  }
}
