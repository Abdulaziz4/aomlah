import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/app.router.dart';
import 'package:aomlah/core/app/utils/custom_theme.dart';
import 'package:aomlah/core/models/aomlah_user.dart';
import 'package:aomlah/core/models/bitcoin.dart';
import 'package:aomlah/core/models/real_time_wallet.dart';
import 'package:aomlah/core/services/price_service.dart';
import 'package:aomlah/core/services/realtime_wallet_service.dart';
import 'package:aomlah/core/services/user_service.dart';
import 'package:aomlah/core/services/wallet_managment_service.dart';
import 'package:aomlah/ui/shared/arabic_material_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';

import 'core/models/eth_real_time_wallet.dart';
import 'core/services/realtime_eth_wallet_service.dart';

void main() async {
  // await setupLocator();
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
          create: (_) => locator<PriceService>().priceContrller.stream,
          initialData: Bitcoin(0.0),
        ),
        StreamProvider<RealTimeWallet>(
          create: (_) =>
              locator<RealtimeWalletService>().walletController.stream,
          initialData: RealTimeWallet.dummy(),
        ),
        StreamProvider<EthRealTimeWallet>(
          create: (_) =>
              locator<RealtimeEthWalletService>().walletController.stream,
          initialData: EthRealTimeWallet.dummy(),
        ),
      ],
      child: StreamProvider<AomlahUser>(
        initialData: AomlahUser.anonymous(),
        create: (_) => locator<UserService>().userController.stream,
        child: ArabicMaterialApp(
          theme: CustomTheme.mainTheme,
          navigatorKey: StackedService.navigatorKey,
          onGenerateRoute: StackedRouter().onGenerateRoute,
        ),
      ),
    );
  }
}
