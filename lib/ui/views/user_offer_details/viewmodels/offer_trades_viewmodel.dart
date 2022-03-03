import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/logger.dart';
import 'package:aomlah/core/models/offer.dart';
import 'package:aomlah/core/models/trade.dart';
import 'package:aomlah/core/services/supabase_service.dart';
import 'package:stacked/stacked.dart';

class OfferTradesViewModel extends StreamViewModel<List<Trade>> {
  final _logger = getLogger("OfferTradesViewModel");

  late Offer offer;
  OfferTradesViewModel(this.offer) {
    setBusy(true);
    _supabaseService.listenToOfferTrades(offer.offerID);
  }

  final _supabaseService = locator<SupabaseService>();

  List<Trade> trades = [];

  @override
  void onData(List<Trade>? data) {
    _logger.i("onData");
    super.onData(data);
    setBusy(false);
    if (data != null) {
      trades = data;
    }
  }

  @override
  void onError(error) {
    super.onError(error);
    _logger.e("Error occured with meessage $error");
  }

  @override
  Stream<List<Trade>> get stream =>
      _supabaseService.offerTradesController.stream;
}
