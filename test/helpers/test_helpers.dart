import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/models/aomlah_user.dart';
import 'package:aomlah/core/services/auth_service.dart';
import 'package:aomlah/core/services/supabase_service.dart';
import 'package:aomlah/core/services/trading_service.dart';
import 'package:aomlah/core/services/user_service.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stacked_services/stacked_services.dart';

import '../mocks/mocks.dart';

void removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}

UserService getAndRegisterUserService() {
  removeRegistrationIfExists<UserService>();
  final service = MockUserService();

  when(() => service.user).thenAnswer(
    (_) => AomlahUser(
      profileId: "123456",
      name: "Abdulaziz",
      isVerified: true,
      bankAccounts: [],
      btcWallet: null,
      ethWallet: null,
      isOnline: true,
      debt: 0,
    ),
  );
  locator.registerSingleton<UserService>(service);
  return service;
}

NavigationService getAndRegisterNavigationService() {
  removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();

  locator.registerSingleton<NavigationService>(service);
  return service;
}

SupabaseService getAndRegisterSupabaseService() {
  removeRegistrationIfExists<SupabaseService>();

  final service = MockSupabaseService();
  locator.registerSingleton<SupabaseService>(service);
  return service;
}

AuthService getAndRegisterAuthService() {
  removeRegistrationIfExists<AuthService>();

  final service = MockAuthService();
  locator.registerSingleton<AuthService>(service);
  return service;
}

SnackbarService getAndRegisterSnackbarService() {
  removeRegistrationIfExists<SnackbarService>();

  final service = MockSnackbarService();
  locator.registerSingleton<SnackbarService>(service);
  return service;
}

TradingService getAndRegisterTradingService() {
  removeRegistrationIfExists<TradingService>();

  final service = MockTradingService();
  locator.registerSingleton<TradingService>(service);
  return service;
}

void registerServices() {
  getAndRegisterUserService();
  getAndRegisterNavigationService();
  getAndRegisterSupabaseService();
  getAndRegisterAuthService();
  getAndRegisterSnackbarService();
  getAndRegisterTradingService();
}

void unregisterService() {
  locator.unregister<UserService>();
  locator.unregister<NavigationService>();
  locator.unregister<SupabaseService>();
  locator.unregister<AuthService>();
  locator.unregister<SnackbarService>();
  locator.unregister<TradingService>();
}
