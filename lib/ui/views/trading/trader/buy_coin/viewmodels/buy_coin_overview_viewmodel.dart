import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/app.router.dart';
import 'package:aomlah/core/app/logger.dart';
import 'package:aomlah/core/app/utils/uuid_helper.dart';
import 'package:aomlah/core/enums/trade_state.dart';
import 'package:aomlah/core/models/offer.dart';
import 'package:aomlah/core/models/trade.dart';
import 'package:aomlah/core/services/supabase_service.dart';
import 'package:aomlah/core/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BuyCoinOverviewViewmodel extends StreamViewModel<List<Offer>> {
  final _logger = getLogger("BuyCoinOverviewViewmodel");

  final _navService = locator<NavigationService>();
  final _supabaseService = locator<SupabaseService>();
  final _userService = locator<UserService>();
  final formKey = GlobalKey<FormState>();

  double amount = 0;

  late Offer offer;

  void listentoOffers(Offer offer) {
    this.offer = offer;
  }

  Future<void> submit(double price) async {
    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    setBusy(true);
    try {
      print(amount);
      print(price);
      print((amount / 3.75) / price);
      final trade = Trade(
        tradeId: UuidHelper.generate(),
        amount: (amount / 3.75) / price,
        offerId: offer.offerID,
        status: TradeStatus.awaiting_payment,
        traderId: _userService.user.profileId,
        price: price,
      );
      final addedTrade = await _supabaseService.createTrade(trade);
      setBusy(false);
      _navService.replaceWith(Routes.traderBuyCoinView,
          arguments: TraderBuyCoinViewArguments(trade: addedTrade));
    } catch (err) {
      _logger.e("Error while creating trade $err");
    }
  }

  void setAmount(String reqAmount) {
    amount = double.parse(reqAmount);
  }

  @override
  void onData(List<Offer>? data) {
    super.onData(data);
    if (data != null) {
      offer = data.firstWhere((off) => off.offerID == offer.offerID);
    }
  }

  @override
  Stream<List<Offer>> get stream => _supabaseService.offersController.stream;
}
