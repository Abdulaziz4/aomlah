import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/app.router.dart';
import 'package:aomlah/core/services/auth_service.dart';
import 'package:aomlah/core/services/supabase_service.dart';
import 'package:aomlah/ui/views/settings/settings_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stacked_services/stacked_services.dart';

import '../helpers/test_helpers.dart';
import '../mocks/mocks.dart';

void main() {
  group("SettingsViewModel tests | logout | ", () {
    setUp(() => registerServices());
    tearDown(() => unregisterService());

    test("should call logout and show welcomeView", () {
      removeRegistrationIfExists<AuthService>();
      final auth = MockAuthService();
      when(
        () => auth.signOut(),
      ).thenAnswer((_) => Future.value());
      locator.registerSingleton<AuthService>(auth);

      removeRegistrationIfExists<NavigationService>();
      final nav = MockNavigationService();
      when(() => nav.clearStackAndShow(Routes.welcomeView)).thenAnswer(
        (_) => Future.value(),
      );
      locator.registerSingleton<NavigationService>(nav);

      final viewmodel = SettingsViewModel();
      viewmodel.logout();

      verify(() => auth.signOut());
      verify(() => nav.clearStackAndShow(Routes.welcomeView));
    });
  });

  group("SettingsViewModel tests | updateUserName | ", () {
    setUp(() => registerServices());
    tearDown(() => unregisterService());

    test("should call updateUserProfile and navigate back", () {
      removeRegistrationIfExists<SupabaseService>();
      final supabase = MockSupabaseService();
      when(() => supabase.updateUserProfile(any(), any()))
          .thenAnswer((_) => Future.value());
      locator.registerSingleton<SupabaseService>(supabase);

      removeRegistrationIfExists<NavigationService>();
      final nav = MockNavigationService();
      when(() => nav.back()).thenReturn(true);
      locator.registerSingleton<NavigationService>(nav);

      final viewmodel = SettingsViewModel();
      viewmodel.updateUserName("Ali");

      verify(() => supabase.updateUserProfile(any(), any()));
      verify(() => nav..back());
    });
  });
}
