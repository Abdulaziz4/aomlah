import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/models/bank_account.dart';
import 'package:aomlah/core/services/supabase_service.dart';
import 'package:aomlah/core/services/user_service.dart';
import 'package:aomlah/ui/views/user_bank_accounts/viewmodels/user_bank_accounts_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/test_helpers.dart';
import '../mocks/mocks.dart';

void main() {
  group(
    "UserBankAccountsViewmodel tests | deleteBank | ",
    () {
      setUp(() {
        registerFallbackValue(FakeBankAccount());
        registerServices();
      });

      tearDown(() {
        unregisterService();
      });
      test("should call deleteBankAccount and update user", () async {
        removeRegistrationIfExists<SupabaseService>();
        final supabase = MockSupabaseService();
        when(() => supabase.deleteBankAccount(any()))
            .thenAnswer((_) => Future.value());
        locator.registerSingleton<SupabaseService>(supabase);

        removeRegistrationIfExists<UserService>();
        final userService = MockUserService();

        when(() => userService.fetchAndUpdateUser()).thenAnswer(
          (invocation) => Future.value(),
        );
        locator.registerSingleton<UserService>(userService);

        final viewmodel = UserBankAccountsViewmodel();
        await viewmodel.deleteBank(
          BankAccount(iban: "", ownerName: "", bankName: "", profileId: ""),
        );

        verify(() => supabase.deleteBankAccount(any()));
        verify(() => userService.fetchAndUpdateUser());
      });
    },
  );
}
