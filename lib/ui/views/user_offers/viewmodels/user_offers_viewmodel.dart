import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/logger.dart';
import 'package:aomlah/core/models/offer.dart';
import 'package:aomlah/core/services/supabase_service.dart';
import 'package:aomlah/core/services/user_service.dart';
import 'package:stacked/stacked.dart';

class UserOfferViewModel extends StreamViewModel<List<Offer>> {
  final _logger = getLogger("UserOfferViewModel");

  final _userService = locator<UserService>();
  final _supabaseService = locator<SupabaseService>();

  List<Offer> offers = [];

  List<Offer> get buyOffers => offers.where((offer) => offer.isBuy).toList();
  List<Offer> get sellOffers => offers.where((offer) => !offer.isBuy).toList();

  void listenToOffers() {
    _supabaseService.listenToUserOffers(_userService.user.profileId);
    setBusy(true);
  }

  @override
  void onData(List<Offer>? data) {
    super.onData(data);
    setBusy(false);
    if (data != null) {
      offers = data;
    }
  }

  @override
  void onError(error) {
    super.onError(error);
    setBusy(false);
    _logger.e("Error $error");
  }

  @override
  Stream<List<Offer>> get stream =>
      _supabaseService.userOffersController.stream;
}
