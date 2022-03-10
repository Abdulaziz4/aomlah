import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/models/bank_account.dart';
import 'package:aomlah/core/services/supabase_service.dart';
import 'package:aomlah/core/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddBankAccountViewmodel extends BaseViewModel {
  final _supabaseService = locator<SupabaseService>();
  final _userService = locator<UserService>();
  final _navService = locator<NavigationService>();

  String? bankAccount = "بنك الراجحي";
  String? name;
  String? iban;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final List<String> bankList = [
    'بنك الاهلي',
    'بنك الراجحي',
    'بنك ساب',
    'بنك الرياض',
    'بنك الإنماء',
    'بنك البلاد',
    'البنك السعودي للإستثمار'
  ];

  void submit() async {
    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    setBusy(true);
    final bank = BankAccount(
      iban: iban!,
      ownerName: name!,
      bankName: bankAccount!,
      profileId: _userService.user.profileId,
    );
    await _supabaseService.createBank(bank);
    setBusy(false);
    _navService.back();
  }

  void setBank(String? value) {
    bankAccount = value ?? "";
    notifyListeners();
  }

  void setName(String? value) {
    name = value ?? "";
  }

  void setIban(String? value) {
    iban = value ?? "";
  }
}
