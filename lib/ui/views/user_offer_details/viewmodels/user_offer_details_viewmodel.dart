import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/logger.dart';
import 'package:aomlah/core/models/offer.dart';
import 'package:aomlah/core/services/supabase_service.dart';
import 'package:stacked/stacked.dart';

class UserOffersDetailsViewModel extends StreamViewModel<List<Offer>> {
  final _logger = getLogger("UserOffersDetailsViewModel");

  final _supabaseService = locator<SupabaseService>();

  late Offer offer;
  UserOffersDetailsViewModel(this.offer);

  @override
  void onData(List<Offer>? data) {
    super.onData(data);
    if (data != null) {
      offer = data.firstWhere((off) => off.offerID == offer.offerID);
    }
  }

  @override
  void onError(error) {
    super.onError(error);
    _logger.e("Error $error");
  }

  @override
  Stream<List<Offer>> get stream =>
      _supabaseService.userOffersController.stream;
}
