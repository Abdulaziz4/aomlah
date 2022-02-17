import 'dart:convert';

import 'package:aomlah/core/models/unconfirmed_transaction.dart';
import 'package:aomlah/core/models/wallet.dart';
import 'package:aomlah/core/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/app/app.locator.dart';
import '../../../core/app/app.router.dart';
import '../../../core/services/wallet_managment_service.dart';

class WithdrawViewModel extends BaseViewModel {
  final navService = locator<NavigationService>();
  final walletService = locator<WalletManagmentService>();
  final userService = locator<UserService>();

  sendTran(String to, int amount) async {
    UnconfirmedTransaction transaction = await walletService.sendTransaction(
        userService.user.wallet!.address, to, amount);

    // print(n['tx']);
    // return n;
    print('from: ' + transaction.from);
    print('to: ' + transaction.to);
    print('total: ' + transaction.total.toString());
    print('fees: ' + transaction.fees.toString());
    print('toSign: ' + transaction.toSign);
    print(transaction.tJson);
    // signSendTransaction(userService.user.wallet!, transaction);
    // print('Crypto Type: $to');
    // print('AmountL $amount');
    navService.navigateTo(Routes.confirmWithdrawView, arguments: transaction);
  }

  void signSendTransaction(UnconfirmedTransaction transaction) async {
    Map<String, dynamic> signedJson =
        transaction.signedTransaction(userService.user.wallet!);
    await walletService.sendSignedTransaction(signedJson);
  }
}
