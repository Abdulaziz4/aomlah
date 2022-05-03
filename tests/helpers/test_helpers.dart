import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/services/user_service.dart';
import 'package:stacked_services/stacked_services.dart';

import '../mocks/mocks.dart';

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}

UserService getAndRegisterUserService() {
  _removeRegistrationIfExists<UserService>();
  final service = MockUserService();
  locator.registerSingleton<UserService>(service);
  return service;
}

NavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

void registerServices() {
  getAndRegisterUserService();
  getAndRegisterNavigationService();
}

void unregisterService() {
  locator.unregister<UserService>();
  locator.unregister<NavigationService>();
}
