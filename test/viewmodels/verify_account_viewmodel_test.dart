import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/services/supabase_service.dart';
import 'package:aomlah/ui/views/auth/verify_account_promotion/verify_account_promotion_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/test_helpers.dart';
import '../mocks/mocks.dart';

void main() {
  group("VerifyAccountViewmodel tests | sendVerificationRequest | ", () {
    setUp(() => registerServices());

    tearDown(() => unregisterService());

    test(
      "should call verifyUser",
      () async {
        removeRegistrationIfExists<SupabaseService>();
        final supabase = MockSupabaseService();
        when(
          () => supabase.verifyUser(
            isVerified: true,
            uuid: any(named: "uuid"),
          ),
        ).thenAnswer((_) => Future.value());
        locator.registerSingleton<SupabaseService>(supabase);

        final viewmodel = VerifyAccountViewModel();
        await viewmodel.sendVerificationRequest();

        verify(
          () => supabase.verifyUser(
            isVerified: true,
            uuid: any(named: "uuid"),
          ),
        );
      },
    );
  });
}
