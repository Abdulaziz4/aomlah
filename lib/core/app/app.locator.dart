// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:aomlah/core/services/swap_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/auth_service.dart';
import '../services/btc_price_service.dart';
import '../services/candles_service.dart';
import '../services/crypto_info_service.dart';
import '../services/erc20_wallet_managment_service.dart';
import '../services/eth_price_service.dart';
import '../services/eth_wallet_managment_service.dart';
import '../services/offers_service.dart';
import '../services/prediction_service.dart';
import '../services/realtime_erc20_wallet_service.dart';
import '../services/realtime_eth_wallet_service.dart';
import '../services/realtime_wallet_service.dart';
import '../services/supabase_service.dart';
import '../services/trading_service.dart';
import '../services/user_service.dart';
import '../services/wallet_managment_service.dart';

final locator = StackedLocator.instance;

Future setupLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => WalletManagmentService());
  locator.registerLazySingleton(() => EthWalletManagmentService());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => BtcPriceService());
  locator.registerLazySingleton(() => EthPriceService());
  locator.registerLazySingleton(() => CryptoInfoService());
  locator.registerLazySingleton(() => RealtimeWalletService());
  locator.registerLazySingleton(() => RealtimeEthWalletService());
  locator.registerLazySingleton(() => ERC20RealtimeWalletService());
  locator.registerLazySingleton(() => SwapService());
  locator.registerLazySingleton(() => CandlesService());
  locator.registerLazySingleton(() => TradingService());
  locator.registerLazySingleton(() => OffersService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => PredictionService());
  locator.registerLazySingleton(() => Erc20WalletManagmentService());
  final supabaseService = await SupabaseService.getInstance();
  locator.registerSingleton(supabaseService);
}
