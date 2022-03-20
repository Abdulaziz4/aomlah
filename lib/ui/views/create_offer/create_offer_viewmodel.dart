import 'package:aomlah/core/app/utils/uuid_helper.dart';
import 'package:aomlah/core/models/offer.dart';
import 'package:aomlah/core/services/supabase_service.dart';
import 'package:aomlah/core/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/app/app.locator.dart';
import '../../../core/app/app.router.dart';
import '../../../core/models/bank_account.dart';

class CreateOfferViewModel extends BaseViewModel {
  final UserService userService = locator<UserService>();
  final supabaseService = locator<SupabaseService>();
  final navService = locator<NavigationService>();
  List<BankAccount> bankAccount = List.empty(growable: true);
  int counter = 0;

  navigatesToBankAccounts() {
    navService.navigateTo(Routes.userBankAccountsView);
  }

  void selectBankAccount() async {
    if (counter >= 3) return;
    final bank = await navService.navigateTo(
      Routes.userBankAccountsView,
      arguments: UserBankAccountsViewArguments(allowSelection: true),
    );
    bankAccount.add(bank as BankAccount);
    counter++;
    notifyListeners();
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
    if (counter <= 0) return;
    try {
      setBusy(true);
      supabaseService.createSellOffer(
          Offer(
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
              bankAccounts: bankAccount),
          bankAccount);
      setBusy(false);
      navService.back();
    } catch (e) {
      print(e);
    }
  }
}
