import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/app.router.dart';
import 'package:aomlah/core/app/utils/custom_theme.dart';
import 'package:aomlah/core/models/aomlah_user.dart';
import 'package:aomlah/core/models/bitcoin.dart';
import 'package:aomlah/core/models/ethereum.dart';
import 'package:aomlah/core/models/real_time_wallet.dart';
import 'package:aomlah/core/services/price_service.dart';
import 'package:aomlah/core/services/realtime_wallet_service.dart';
import 'package:aomlah/core/services/user_service.dart';
import 'package:aomlah/ui/shared/arabic_material_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/models/eth_real_time_wallet.dart';
import 'core/services/btc_price_service.dart';
import 'core/services/eth_price_service.dart';
import 'core/services/realtime_eth_wallet_service.dart';

void main() async {
  // await setupLocator();
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<AomlahUser>(
          create: (_) => locator<UserService>().userController.stream,
          initialData: AomlahUser.anonymous(),
        ),
        StreamProvider<Bitcoin>(
          create: (_) => locator<BtcPriceService>().priceContrller.stream,
          initialData: Bitcoin(0.0),
        ),
        StreamProvider<Ethereum>(
          create: (_) => locator<EthPriceService>().priceContrller.stream,
          initialData: Ethereum(0.0),
        ),
        StreamProvider<BtcRealTimeWallet>(
          create: (_) =>
              locator<RealtimeWalletService>().walletController.stream,
          initialData: BtcRealTimeWallet.dummy(),
        ),
        StreamProvider<EthRealTimeWallet>(
          create: (_) =>
              locator<RealtimeEthWalletService>().walletController.stream,
          initialData: EthRealTimeWallet.dummy(),
        ),
      ],
      child: ArabicMaterialApp(
        theme: CustomTheme.mainTheme,
        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: StackedRouter().onGenerateRoute,
      ),
    );
  }
}
