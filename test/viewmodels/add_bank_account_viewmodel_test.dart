import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/services/supabase_service.dart';
import 'package:aomlah/ui/views/add_bank_account/viewmodels/add_bank_account_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stacked_services/stacked_services.dart';

import '../helpers/test_helpers.dart';
import '../mocks/mocks.dart';

void main() {
  group('AddBankAccountViewModel tests | createBankAccount | ', () {
    setUp(() {
      registerFallbackValue(FakeBankAccount());
      registerServices();
    });

    tearDown(() => unregisterService());

    test(
      'when createBankAccount is called with valid input should called createBank and navigate back',
      () async {
        removeRegistrationIfExists<SupabaseService>();
        final supabase = MockSupabaseService();
        when(() => supabase.createBank(any()))
            .thenAnswer((_) => Future.value());
        locator.registerSingleton<SupabaseService>(supabase);

        removeRegistrationIfExists<NavigationService>();
        final nav = MockNavigationService();
        when(() => nav.back()).thenReturn(true);
        locator.registerSingleton<NavigationService>(nav);

        final viewmodel = AddBankAccountViewmodel();
        viewmodel.setBank('بنك الاهلي');
        viewmodel.setName("Abdulaziz");
        viewmodel.setIban("SA1938198349179471941");

        await viewmodel.createBankAccount();

        verify(() => supabase.createBank(any()));
        verify(() => nav.back());
      },
    );
  });
}
