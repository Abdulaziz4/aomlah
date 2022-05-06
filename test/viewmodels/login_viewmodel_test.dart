import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/app.router.dart';
import 'package:aomlah/core/services/auth_service.dart';
import 'package:aomlah/ui/views/auth/Login/login_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stacked_services/stacked_services.dart';

import '../helpers/test_helpers.dart';
import '../mocks/mocks.dart';

void main() {
  const String email = "test@test.com";
  const String pass = "12341234";
  group(
    "LoginViewModel tests | login |",
    () {
      setUp(() => registerServices());

      tearDown(() => unregisterService());

      test(
        "when login is called loginWithEmail is called with correct email and password and navigated to navigation view",
        () async {
          removeRegistrationIfExists<NavigationService>();
          final nav = MockNavigationService();
          when(() => nav.navigateTo(Routes.navigationView))
              .thenAnswer((_) => Future.value());
          locator.registerSingleton<NavigationService>(nav);

          removeRegistrationIfExists<AuthService>();
          final auth = MockAuthService();
          when(
            () => auth.loginWithEmail(
              email: email,
              password: pass,
            ),
          ).thenAnswer((_) => Future.value());
          locator.registerSingleton<AuthService>(auth);

          final LoginViewModel viewModel = LoginViewModel();
          viewModel.email = email;
          viewModel.password = pass;
          await viewModel.login();

          verify(() => auth.loginWithEmail(email: email, password: pass));
          verify(() => nav.navigateTo(Routes.navigationView));
        },
      );

      test(
        "loginWithEmail throws exception then error message is initlized",
        () async {
          removeRegistrationIfExists<AuthService>();
          final auth = MockAuthService();
          when(
            () => auth.loginWithEmail(
              email: email,
              password: pass,
            ),
          ).thenThrow(Exception());
          locator.registerSingleton<AuthService>(auth);

          final LoginViewModel viewModel = LoginViewModel();
          viewModel.email = email;
          viewModel.password = pass;
          await viewModel.login();

          expect(viewModel.errorMessage, "حدث خطأ");
          verify(() => auth.loginWithEmail(email: email, password: pass));
        },
      );
    },
  );
}
