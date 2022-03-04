import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/app.router.dart';
import 'package:aomlah/core/app/logger.dart';
import 'package:aomlah/core/app/utils/uuid_helper.dart';
import 'package:aomlah/core/enums/trade_state.dart';
import 'package:aomlah/core/models/offer.dart';
import 'package:aomlah/core/models/trade.dart';
import 'package:aomlah/core/services/trading_service.dart';
import 'package:aomlah/core/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BuyCoinOverviewViewmodel extends BaseViewModel {
  final _logger = getLogger("BuyCoinOverviewViewmodel");

  final _navService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _tradingService = locator<TradingService>();

  final formKey = GlobalKey<FormState>();

  double amount = 0;

  Future<void> submit(double price, Offer offer) async {
    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    setBusy(true);
    try {
      final trade = Trade(
        tradeId: UuidHelper.generate(),
        amount: (amount / 3.75) / price,
        offerId: offer.offerID,
        status: TradeStatus.awaiting_payment,
        traderId: _userService.user.profileId,
        price: price,
        offer: offer,
      );
      final addedTrade = await _tradingService.createTrade(trade);
      setBusy(false);
      _navService.replaceWith(
        Routes.traderBuyCoinView,
        arguments: TraderBuyCoinViewArguments(
          trade: addedTrade,
        ),
      );
    } catch (err) {
      _logger.e("Error while creating trade $err");
    }
  }

  void setAmount(String reqAmount) {
    amount = double.parse(reqAmount);
  }
}
