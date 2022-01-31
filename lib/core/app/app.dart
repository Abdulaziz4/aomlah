import 'package:aomlah/core/services/supabase_service.dart';
import 'package:aomlah/ui/views/create_offer/create_offer_view.dart';
import 'package:aomlah/ui/views/navigation/navigation_view.dart';
import 'package:aomlah/ui/views/profile/profile_view.dart';
import 'package:aomlah/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    // Register all views
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: NavigationView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: CreateOfferView),
  ],
  dependencies: [
    // Register all services and deps.
    Presolve(
      classType: SupabaseService,
      presolveUsing: SupabaseService.getInstance,
    ),
    LazySingleton<NavigationService>(classType: NavigationService),
  ],
)
class App {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
