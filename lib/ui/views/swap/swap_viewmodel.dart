import 'dart:math';

import 'package:aomlah/core/app/utils/currency_helper.dart';
import 'package:aomlah/core/enums/token_addresses.dart';
import 'package:aomlah/core/enums/token_decimals.dart';
import 'package:stacked/stacked.dart';

import '../../../core/app/app.locator.dart';
import '../../../core/services/swap_service.dart';
import '../../../core/services/user_service.dart';

class SwapCryptocurrencyViewModel extends BaseViewModel {
  final swapService = locator<SwapService>();
  final userService = locator<UserService>();
  Future<double> getExchangeRate(
      String token1, String token2, double token1Amount) async {
    setBusy(true);
    String tokenAddress1 = getTokenAddress(token1);
    String tokenAddress2 = getTokenAddress(token2);
    int tokenDecimal1 = getTokenDecimals(token1);
    String private = userService.user.ethWallet!.privateKey;
    double amountToken1 = token1Amount * pow(10, tokenDecimal1);
    Map<String, dynamic> pair = await swapService.getExchangeRate(
        private, tokenAddress1, tokenAddress2, amountToken1);
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
    // print('$token  $tokenAmount');
    setBusy(true);

    String private = userService.user.ethWallet!.privateKey;
    String tokenAddress = getTokenAddress(token);
    // int tokenDecimal = getTokenDecimals(token);
    double amountEth = tokenAmount * pow(10, TokenDecimals.ethTokenDecimals);

    await swapService.swapExactEthForToken(private, tokenAddress, amountEth);
    setBusy(false);
  }

  Future<void> swapExactTokensForETH(String token, double tokenAmount) async {
    // print('$token  $tokenAmount');
    setBusy(true);
    String private = userService.user.ethWallet!.privateKey;
    String tokenAddress = getTokenAddress(token);
    int tokenDecimal = getTokenDecimals(token);

    double amountToken = tokenAmount * pow(10, tokenDecimal);

    await swapService.swapExactTokensForETH(private, tokenAddress, amountToken);
    setBusy(false);
  }

  Future<void> swapExactTokensForTokens(
      String token0, String token1, double tokenAmount) async {
    // print('$token1 $token2 $tokenAmount');
    setBusy(true);
    String private = userService.user.ethWallet!.privateKey;
    String token0Address = getTokenAddress(token0);
    String token1Address = getTokenAddress(token1);
    int token0Decimal = getTokenDecimals(token0);

    double amountToken0 = tokenAmount * pow(10, token0Decimal);

    await swapService.swapExactTokensForTokens(
        private, token0Address, token1Address, amountToken0);
    setBusy(false);
  }
}
