import 'package:aomlah/core/enums/crypto_types.dart';
import 'package:aomlah/core/enums/token_addresses.dart';
import 'package:aomlah/core/models/unconfirmed_transaction.dart';
import 'package:aomlah/core/services/erc20_wallet_managment_service.dart';
import 'package:aomlah/core/models/wallet.dart';
import 'package:aomlah/core/services/user_service.dart';
import 'package:aomlah/ui/views/withdraw/common/transaction_obj.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../core/app/app.locator.dart';
import '../../../core/app/app.router.dart';
import '../../../core/services/eth_wallet_managment_service.dart';
import '../../../core/services/wallet_managment_service.dart';

class WithdrawViewModel extends BaseViewModel {
  final navService = locator<NavigationService>();
  final walletService = locator<BtcWalletManagmentService>();
  final ethWalletService = locator<EthWalletManagmentService>();
  final erc20WalletService = locator<Erc20WalletManagmentService>();
  final userService = locator<UserService>();

  Future<void> sendRawTransaction(
      String to, int amount, CryptoTypes types) async {
    setBusy(true);
    String userAddress;
    if (types == CryptoTypes.bitcoin) {
      userAddress = userService.user.btcWallet!.address;
      UnconfirmedTransaction transaction =
          await walletService.sendTransaction(userAddress, to, amount);
      setBusy(false);
      navService.replaceWith(Routes.confirmWithdrawView,
          arguments: TransactionObj(transaction, types));
    } else if (types == CryptoTypes.ethereum) {
      userAddress = userService.user.ethWallet!.address;

      UnconfirmedTransaction transaction =
          await ethWalletService.sendTransaction(userAddress, to, amount);
      setBusy(false);
      navService.replaceWith(Routes.confirmWithdrawView,
          arguments: TransactionObj(transaction, types));
    } else {
      userAddress = userService.user.ethWallet!.address;
      UnconfirmedTransaction transaction =
          await erc20WalletService.sendTransaction(userAddress, to, amount);
      setBusy(false);
      navService.replaceWith(Routes.confirmWithdrawView,
          arguments: TransactionObj(transaction, types));
    }
  }

  returnToWallet() {
    navService.back();
  }

  Future<void> signSendTransaction(
      UnconfirmedTransaction transaction, CryptoTypes types) async {
    setBusy(true);
    Wallet userWallet;
    if (types == CryptoTypes.bitcoin) {
      userWallet = userService.user.btcWallet!;
      Map<String, dynamic> signedJson =
          transaction.signedTransaction(userWallet);
      await walletService.sendSignedTransaction(signedJson);
      setBusy(false);
      navService.back();
    } else if (types == CryptoTypes.ethereum) {
      userWallet = userService.user.ethWallet!;
      Map<String, dynamic> signedJson =
          transaction.signedTransaction(userWallet);
      await ethWalletService.sendSignedTransaction(signedJson);
      setBusy(false);
      navService.back();
    } else {
      userWallet = userService.user.ethWallet!;
      Map<String, dynamic> signedJson =
          transaction.signedTransaction(userWallet);
      await erc20WalletService.sendSignedTransaction(signedJson, types);
      setBusy(false);
      navService.back();
    }
  }
}
