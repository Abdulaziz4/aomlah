import 'package:aomlah/core/enums/crypto_types.dart';
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

import '../../../core/services/btc_price_service.dart';
import '../../../core/services/eth_price_service.dart';

class StartupViewModel extends BaseViewModel {
  Future<void> initApp() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await setupLocator();

    final _priceService = locator<BtcPriceService>();
    _priceService.connect(CryptoTypes.btc);
    final _priceServiceEth = locator<EthPriceService>();
    _priceServiceEth.connect(CryptoTypes.eth);
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
