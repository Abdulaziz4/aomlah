import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/app/app.locator.dart';
import '../../../core/app/app.router.dart';
import '../../../core/models/bank_account.dart';
import '../../../core/services/supabase_service.dart';

class EditOfferViewModel extends BaseViewModel {
  final supabaseService = locator<SupabaseService>();
  final navService = locator<NavigationService>();

  Future<void> editBuyOffer(
      String offerID, double margin, double minTrade, String terms) async {
    setBusy(true);
    await supabaseService.updateBuyOffer(
        offerID: offerID, margin: margin, minTrade: minTrade, terms: terms);
    setBusy(false);
    navService.back();
  }

  Future<void> editSellOffer(
      String offerID, double margin, double minTrade, String terms) async {
    setBusy(true);
    await supabaseService.updateSellOffer(
        offerID: offerID,
        margin: margin,
        minTrade: minTrade,
        terms: terms,
        bankAccounts: bankAccounts);
    setBusy(false);
    navService.back();
  }

  navigatesToBankAccounts() {
    navService.navigateTo(Routes.userBankAccountsView);
  }

  void selectBankAccount() async {
    if (counter >= 3) return;
    final bank = await navService.navigateTo(
      Routes.userBankAccountsView,
      arguments: UserBankAccountsViewArguments(allowSelection: true),
    );
    bankAccounts.add(bank as BankAccount);
    counter++;
    notifyListeners();
  }

  List<BankAccount> bankAccounts = List.empty(growable: true);
  int counter = 0;
}
