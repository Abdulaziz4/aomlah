import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/app.router.dart';
import 'package:aomlah/core/services/auth_service.dart';
import 'package:aomlah/ui/views/auth/Signup/signup_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stacked_services/stacked_services.dart';

import '../helpers/test_helpers.dart';
import '../mocks/mocks.dart';

void main() {
  const String email = "test@test.com";
  const String pass = "12341234";
  const String name = "Abdulaziz";
  group(
    "SignupViewModel tests | signup",
    () {
      test(
          "singupWithEmail called with valid input and navigated to verifyAccountPromotionView",
          () async {
        removeRegistrationIfExists<NavigationService>();
        final nav = MockNavigationService();
        when(() => nav.navigateTo(Routes.verifyAccountPromotionView))
            .thenAnswer((_) => Future.value());
        locator.registerSingleton<NavigationService>(nav);

        removeRegistrationIfExists<AuthService>();
        final auth = MockAuthService();
        when(
          () => auth.signUpWithEmail(
            email: email,
            password: pass,
            name: name,
          ),
        ).thenAnswer((_) => Future.value());
        locator.registerSingleton<AuthService>(auth);

        final viewModel = SignupViewModel();
        viewModel.email = email;
        viewModel.password = pass;
        viewModel.name = name;
        await viewModel.signup();

        verify(
          () => auth.signUpWithEmail(
            email: email,
            password: pass,
            name: name,
          ),
        );
        verify(() => nav.navigateTo(Routes.verifyAccountPromotionView));
      });
    },
  );
}
