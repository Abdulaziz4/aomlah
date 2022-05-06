import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/services/auth_service.dart';
import 'package:aomlah/ui/views/auth/reset_password/reset_password_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/test_helpers.dart';
import '../mocks/mocks.dart';

void main() {
  const email = "test@test.com";

  group(
    "ResetPasswordViewModel tests | resetPassword | ",
    () {
      setUp(() => registerServices());

      tearDown(() => unregisterService());
      test("should call sendPasswordResetCode and set success message",
          () async {
        removeRegistrationIfExists<AuthService>();
        final auth = MockAuthService();
        when(
          () => auth.sendPasswordResetCode(email: email),
        ).thenAnswer((_) => Future.value());
        locator.registerSingleton<AuthService>(auth);

        final viewmodel = ResetPasswordViewModel();
        viewmodel.email = email;
        await viewmodel.resetPassword();

        expect(viewmodel.successMessage, "تم الإرسال");

        verify(() => auth.sendPasswordResetCode(email: email));
      });
      test("when sendPasswordResetCode throws error set error message",
          () async {
        removeRegistrationIfExists<AuthService>();
        final auth = MockAuthService();
        when(
          () => auth.sendPasswordResetCode(email: email),
        ).thenThrow(Exception());
        locator.registerSingleton<AuthService>(auth);

        final viewmodel = ResetPasswordViewModel();
        viewmodel.email = email;
        await viewmodel.resetPassword();

        expect(viewmodel.errorMessage, "حدث خطأ");

        verify(() => auth.sendPasswordResetCode(email: email));
      });
    },
  );
}
