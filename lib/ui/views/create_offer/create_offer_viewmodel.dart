import 'package:aomlah/core/app/utils/uuid_helper.dart';
import 'package:aomlah/core/models/offer.dart';
import 'package:aomlah/core/services/supabase_service.dart';
import 'package:aomlah/core/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/app/app.locator.dart';
import '../../../core/app/app.router.dart';

class CreateOfferViewModel extends BaseViewModel {
  final UserService userService = locator<UserService>();
  final supabaseService = locator<SupabaseService>();
  final navService = locator<NavigationService>();

  navigateToBankAccounts() {
    navService.navigateTo(Routes.userBankAccountsView);
  }

  Future<void> submitBuyOffer(String cryptoType, String currencyType,
      double margin, double cryptoAmount, double minTrade, String terms) async {
    try {
      setBusy(true);
      await supabaseService.createOffer(Offer(
        offerID: UuidHelper.generate(),
        ownerID: userService.user.profileId,
        cryptoType: cryptoType,
        isBuy: true,
        currencyType: currencyType,
        margin: margin,
        totalQuantity: cryptoAmount,
        remainingQuantity: cryptoAmount,
        minTrade: minTrade,
        terms: terms,
      ));
      setBusy(false);
      navService.back();
    } catch (e) {
      print(e);
    }
  }

  Future<void> submitSellOffer(String cryptoType, String currencyType,
      double margin, double cryptoAmount, double minTrade, String terms) async {
    try {
      setBusy(true);
      supabaseService.createOffer(Offer(
        offerID: UuidHelper.generate(),
        ownerID: userService.user.profileId,
        cryptoType: cryptoType,
        isBuy: false,
        currencyType: currencyType,
        remainingQuantity: cryptoAmount,
        margin: margin,
        totalQuantity: cryptoAmount,
        minTrade: minTrade,
        terms: terms,
      ));
      setBusy(false);
      navService.back();
    } catch (e) {
      print(e);
    }
  }
}
