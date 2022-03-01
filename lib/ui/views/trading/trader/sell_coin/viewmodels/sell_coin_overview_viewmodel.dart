import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/app/app.router.dart';
import 'package:aomlah/core/app/utils/uuid_helper.dart';
import 'package:aomlah/core/enums/trade_state.dart';
import 'package:aomlah/core/models/bank_account.dart';
import 'package:aomlah/core/models/trade.dart';
import 'package:aomlah/core/services/trading_service.dart';
import 'package:aomlah/core/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SellCoinOverviewViewModel extends BaseViewModel {
  final _navService = locator<NavigationService>();
  final _tradingService = locator<TradingService>();
  final _userService = locator<UserService>();

  final formKey = GlobalKey<FormState>();

  double amount = 0;

  BankAccount? bankAccount;

  String? errorMessage;

  void submit(double price, String offerId) {
    resetBankError();

    bool isValid = formKey.currentState!.validate();

    if (!isValid) {
      return;
    }
    if (bankAccount == null) {
      setBankError();
      return;
    }

    formKey.currentState!.save();
    setBusy(true);
    final trade = Trade(
      tradeId: UuidHelper.generate(),
      amount: (amount / 3.75) / price,
      offerId: offerId,
      status: TradeStatus.awaiting_payment,
      traderId: _userService.user.profileId,
      price: price,
      bankIban: bankAccount!.iban,
    );
    _tradingService.createTrade(trade);
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
  }

  void resetBankError() {
    errorMessage = null;
    notifyListeners();
  }

  void setBankError() {
    errorMessage = "الرجاء اختيار حساب بنكي";
    notifyListeners();
  }
}
