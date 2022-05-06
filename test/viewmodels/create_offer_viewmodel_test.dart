import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/models/bank_account.dart';
import 'package:aomlah/core/services/supabase_service.dart';
import 'package:aomlah/ui/views/create_offer/create_offer_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stacked_services/stacked_services.dart';

import '../helpers/test_helpers.dart';
import '../mocks/mocks.dart';

void main() {
  const cryptoType = "BTC";
  const currencyType = "ر.س";
  const margin = 100.0;
  const amount = 2.2;
  const minTrade = 2500.0;
  const terms = "terms";

  group('CreateOfferViewModel tests | submitSellOffer | ', () {
    setUp(
      () {
        registerFallbackValue(FakeOffer());
        registerServices();
      },
    );

    tearDown(
      () {
        unregisterService();
      },
    );
    test(
      "should call createSellOffer and navigate back "
      "when bank account selected",
      () async {
        removeRegistrationIfExists<NavigationService>();
        final nav = MockNavigationService();
        when(() => nav.back()).thenReturn(true);
        locator.registerSingleton<NavigationService>(nav);

        removeRegistrationIfExists<SupabaseService>();
        final supabase = MockSupabaseService();
        when(() => supabase.createSellOffer(any(), any()))
            .thenAnswer((_) => Future.value());
        locator.registerSingleton<SupabaseService>(supabase);

        final viewmodel = CreateOfferViewModel();
        viewmodel.bankAccount = [
          BankAccount(
            iban: "",
            ownerName: "",
            bankName: "",
            profileId: "",
          ),
        ];
        await viewmodel.submitSellOffer(
          cryptoType,
          currencyType,
          margin,
          amount,
          minTrade,
          terms,
        );

        verify((() => supabase.createSellOffer(any(), any())));
        verify(() => nav.back());
      },
    );
  });
}
