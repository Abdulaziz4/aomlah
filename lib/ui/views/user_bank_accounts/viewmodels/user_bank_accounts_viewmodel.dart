import 'package:aomlah/core/app/app.locator.dart';
import 'package:aomlah/core/models/bank_account.dart';
import 'package:aomlah/core/services/supabase_service.dart';
import 'package:aomlah/core/services/user_service.dart';
import 'package:stacked/stacked.dart';

class UserBankAccountsViewmodel extends BaseViewModel {
  final _supabaseService = locator<SupabaseService>();
  final _userService = locator<UserService>();

  Future<void> deleteBank(BankAccount bank) async {
    setBusy(true);
    await _supabaseService.deleteBankAccount(bank);
    await _userService.fetchAndUpdateUser();
    setBusy(false);
  }
}
