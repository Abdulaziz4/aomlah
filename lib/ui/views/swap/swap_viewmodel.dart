import 'dart:math';
import 'package:aomlah/core/enums/token_addresses.dart';
import 'package:aomlah/core/enums/token_decimals.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/app/app.locator.dart';
import '../../../core/services/swap_service.dart';
import '../../../core/services/user_service.dart';

class SwapCryptocurrencyViewModel extends BaseViewModel {
  final swapService = locator<SwapService>();
  final userService = locator<UserService>();
  final snackbarService = locator<SnackbarService>();

  Future<double> getExchangeRate(
      String token1, String token2, double token1Amount) async {
    setBusy(true);
    String tokenAddress1 = getTokenAddress(token1);
    String tokenAddress2 = getTokenAddress(token2);
    int tokenDecimal1;
    tokenDecimal1 = getTokenDecimals(token1);
    String private = userService.user.ethWallet!.privateKey;
    double amountToken1 = token1Amount * pow(10, tokenDecimal1);
    Map<String, dynamic> pair = await swapService.getExchangeRate(
        private: private,
        tokenAddress1: tokenAddress1,
        tokenAddress2: tokenAddress2,
        amountToken1: amountToken1);
    double rate = double.parse(pair['token2'].toString()) /
        double.parse(pair['token1'].toString());
    setBusy(false);

    return rate;
  }

  String getTokenAddress(String tokenName) {
    if (tokenName == 'ETH') {
      return TokenAddresses.wethTokenAddress;
    }
    if (tokenName == 'USDT') {
      return TokenAddresses.usdtTokenAddress;
    }
    if (tokenName == 'UNI') {
      return TokenAddresses.uniTokenAddress;
    }
    if (tokenName == 'BAT') {
      return TokenAddresses.batTokenAddress;
    } else {
      return "Unknown Token";
    }
  }

  int getTokenDecimals(String tokenName) {
    if (tokenName == 'ETH') {
      return TokenDecimals.ethTokenDecimals;
    }
    if (tokenName == 'USDT') {
      return TokenDecimals.usdtTokenDecimals;
    }
    if (tokenName == 'UNI') {
      return TokenDecimals.uniTokenDecimals;
    }
    if (tokenName == 'BAT') {
      return TokenDecimals.batTokenDecimals;
    } else {
      return -1;
    }
  }

  Future<void> swapExactEthForToken(String token, double tokenAmount) async {
    if (!userService.user.isVerified) {
      snackbarService.showSnackbar(
        title: "حسابك غير موثق",
        message: "الرجاء توثيق حسابك لتتمكن من تبديل العملات ",
      );
      return;
    }
    setBusy(true);
    String private = userService.user.ethWallet!.privateKey;
    String tokenAddress = getTokenAddress(token);
    double amountEth = tokenAmount * pow(10, TokenDecimals.ethTokenDecimals);

    await swapService.swapExactEthForToken(
        private: private, tokenAddress: tokenAddress, amountEth: amountEth);
    setBusy(false);
  }

  Future<void> swapExactTokensForETH(String token, double tokenAmount) async {
    if (!userService.user.isVerified) {
      snackbarService.showSnackbar(
        title: "حسابك غير موثق",
        message: "الرجاء توثيق حسابك لتتمكن من تبديل العملات ",
      );
      return;
    }
    setBusy(true);
    String private = userService.user.ethWallet!.privateKey;
    String tokenAddress = getTokenAddress(token);
    int tokenDecimal = getTokenDecimals(token);

    double amountToken = tokenAmount * pow(10, tokenDecimal);

    await swapService.swapExactTokensForETH(
        private: private, tokenAddress: tokenAddress, tokenAmount: amountToken);
    setBusy(false);
  }

  Future<void> swapExactTokensForTokens(
      String token0, String token1, double tokenAmount) async {
    if (!userService.user.isVerified) {
      snackbarService.showSnackbar(
        title: "حسابك غير موثق",
        message: "الرجاء توثيق حسابك لتتمكن من تبديل العملات ",
      );
      return;
    }
    setBusy(true);
    String private = userService.user.ethWallet!.privateKey;
    String token0Address = getTokenAddress(token0);
    String token1Address = getTokenAddress(token1);
    int token0Decimal = getTokenDecimals(token0);

    double amountToken0 = tokenAmount * pow(10, token0Decimal);

    await swapService.swapExactTokensForTokens(
        private: private,
        token0address: token0Address,
        token1address: token1Address,
        amountToken0: amountToken0);
    setBusy(false);
  }
}
