import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../app/logger.dart';
import 'package:http/http.dart' as http;

class SwapService {
  final _logger = getLogger("SwapService");

  final Map<String, String> header = {
    "Content-type": "application/json",
    "Accept": "application/json"
  };
  static final baseUrl =
      // "http://10.0.2.2:8080/api/v1/web3";
      dotenv.env['WEB3_API_URL'] ?? "";

  Future<Map<String, dynamic>> getExchangeRate(
      {required String private,
      required String tokenAddress1,
      required String tokenAddress2,
      required double amountToken1}) async {
    _logger.i("getExchangeRate | args: tokenAddress1=$tokenAddress1 "
        ", tokenAddress2=$tokenAddress2 , amountToken1=$amountToken1");
    Uri url = Uri.parse("$baseUrl/pairrate");
    Map<String, dynamic> body = {
      "private": private,
      "token_address0": tokenAddress1,
      "token_address1": tokenAddress2,
      "amount_token0": amountToken1.toStringAsFixed(0),
    };
    var encodedBody = jsonEncode(body);
    var result = await http.post(url, body: encodedBody, headers: header);

    var res = jsonDecode(result.body);
    return {
      "token1": res['pair'][0],
      "token2": res['pair'][1],
    };
  }

  Future<void> swapExactEthForToken(
      {required String private,
      required String tokenAddress,
      required double amountEth}) async {
    _logger.i(
        "swapExactEthForToken | args: tokenAddress=$tokenAddress , amountEth=$amountEth ");
    Uri url = Uri.parse("$baseUrl/swap/ethtoken");
    Map<String, dynamic> body = {
      "private": private,
      "token_address": tokenAddress,
      "amount_eth": amountEth.toStringAsFixed(0),
    };
    var encodedBody = jsonEncode(body);
    await http.post(url, body: encodedBody, headers: header);
  }

  Future<void> swapExactTokensForETH(
      {required String private,
      required String tokenAddress,
      required double tokenAmount}) async {
    _logger.i(
        "swapExactTokensForETH | args: tokenAddress=$tokenAddress , tokenAmount=$tokenAmount ");
    Uri url = Uri.parse("$baseUrl/swap/tokeneth");
    Map<String, dynamic> body = {
      "private": private,
      "token_address": tokenAddress,
      "amount_token": tokenAmount.toStringAsFixed(0),
    };
    var encodedBody = jsonEncode(body);
    await http.post(url, body: encodedBody, headers: header);
  }

  Future<void> swapExactTokensForTokens(
      {required String private,
      required String token0address,
      required String token1address,
      required double amountToken0}) async {
    _logger.i("swapExactTokensForTokens | args: token0address=$token0address "
        ", token1address=$token1address , amountToken0=$amountToken0 ");
    Uri url = Uri.parse("$baseUrl/swap/token");
    Map<String, dynamic> body = {
      "private": private,
      "token_address0": token0address,
      "token_address1": token1address,
      "amount_token0": amountToken0.toStringAsFixed(0),
    };
    var encodedBody = jsonEncode(body);
    await http.post(url, body: encodedBody, headers: header);
  }
}
