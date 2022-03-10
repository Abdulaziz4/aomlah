import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/app.router.dart';
import 'package:aomlah/core/app/logger.dart';
import 'package:aomlah/core/models/offer.dart';
import 'package:aomlah/core/services/auth_service.dart';
import 'package:aomlah/core/services/supabase_service.dart';

class OffersDiscoveryViewModel extends StreamViewModel<List<Offer>> {
  OffersDiscoveryViewModel() {
    _suabaseService.listentoAllOffers();
  }

  final _logger = getLogger("OffersDiscoveryViewModel");

  final _authService = locator<AuthService>();
  final _navService = locator<NavigationService>();
  final _suabaseService = locator<SupabaseService>();

  List<Offer> offers = [];

  void logout() {
    _authService.signOut();
    _navService.replaceWith(Routes.welcomeView);
  }

  List<Offer> get buyOffers => offers.where((offer) => !offer.isBuy).toList();
  List<Offer> get sellOffers => offers.where((offer) => offer.isBuy).toList();

  @override
  void onSubscribed() {
    super.onSubscribed();
    _logger.i("Subscribed to Realtime Offers");
    setBusy(true);
  }

  @override
  void onData(List<Offer>? data) {
    super.onData(data);
    setBusy(false);
    _logger.i("onData");

    if (data != null) {
      offers = data.toList();
    }
  }

  @override
  void onError(error) {
    super.onError(error);
    _logger.e("An Error Occured $error");
    setBusy(false);
  }

  @override
  Stream<List<Offer>> get stream => _suabaseService.offersController.stream;
}
