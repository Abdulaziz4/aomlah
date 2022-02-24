import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/app.router.dart';
import 'package:aomlah/core/models/bank_account.dart';
import 'package:aomlah/core/services/supabase_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SellCoinOverviewViewModel extends BaseViewModel {
  final _navService = locator<NavigationService>();
  final _supabaseService = locator<SupabaseService>();

  final formKey = GlobalKey<FormState>();

  double amount = 0;

  BankAccount? bankAccount;

  void submit() {
    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    setBusy(true);
    //TODO: Create Trade
    setBusy(false);
    _navService.navigateTo(Routes.traderSellCoinView);
  }

  void setAmount(String reqAmount) {
    amount = double.parse(reqAmount);
  }

  void selectBankAccount() async {
    final bank = await _navService.navigateTo(
      Routes.userBankAccountsView,
      arguments: UserBankAccountsViewArguments(allowSelection: true),
    );
    bankAccount = bank as BankAccount;
    notifyListeners();
    //TODO: Validate BankAccount is not null and do form validation on the bank
  }
}
