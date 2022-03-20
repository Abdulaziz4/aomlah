import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/logger.dart';
import 'package:aomlah/core/models/offer.dart';
import 'package:aomlah/core/services/offers_service.dart';
import 'package:aomlah/core/services/supabase_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UserOffersDetailsViewModel extends StreamViewModel<List<Offer>> {
  final _logger = getLogger("UserOffersDetailsViewModel");

  final _supabaseService = locator<SupabaseService>();
  final _offerService = locator<OffersService>();
  final _snackBarService = locator<SnackbarService>();

  late Offer offer;
  UserOffersDetailsViewModel(this.offer);

  Future<void> closeOffer() async {
    _logger.i("closeOffer");
    try {
      setBusy(true);
      await _offerService.closeOffer(offer);
    } catch (error) {
      _logger.e("Error while closing offer $error");
      _snackBarService.showSnackbar(
        title: "لا يمكنك إغلاق العرض",
        message: error.toString(),
      );
    } finally {
      setBusy(false);
    }
  }

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
