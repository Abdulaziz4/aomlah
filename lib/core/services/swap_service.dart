import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../app/logger.dart';
import 'package:http/http.dart' as http;

class SwapService {
  final Map<String, String> header = {
    "Content-type": "application/json",
    "Accept": "application/json"
  };
  static final baseUrl = dotenv.env['WEB3_API_URL'] ?? "";

  // "http://10.0.2.2:8080/api/v1/web3";

  Future<Map<String, dynamic>> getExchangeRate(String private,
      String tokenAddress1, String tokenAddress2, double amountToken1) async {
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
    print(res);
    return {
      "token1": res['pair'][0],
      "token2": res['pair'][1],
    };
  }

  Future<void> swapExactEthForToken(
      String private, String tokenAddress, double amountEth) async {
    Uri url = Uri.parse("$baseUrl/swap/ethtoken");
    Map<String, dynamic> body = {
      "private": private,
      "token_address": tokenAddress,
      "amount_eth": amountEth.toStringAsFixed(0),
    };
    var encodedBody = jsonEncode(body);

    var result = await http.post(url, body: encodedBody, headers: header);

    print(result.body);
  }

  Future<void> swapExactTokensForETH(
      String private, String tokenAddress, double tokenAmount) async {
    Uri url = Uri.parse("$baseUrl/swap/tokeneth");
    Map<String, dynamic> body = {
      "private": private,
      "token_address": tokenAddress,
      "amount_token": tokenAmount.toStringAsFixed(0),
    };
    var encodedBody = jsonEncode(body);

    var result = await http.post(url, body: encodedBody, headers: header);

    print(result.body);
  }

  Future<void> swapExactTokensForTokens(String private, String token0address,
      String token1address, double amountToken0) async {
    Uri url = Uri.parse("$baseUrl/swap/token");
    Map<String, dynamic> body = {
      "private": private,
      "token_address0": token0address,
      "token_address1": token1address,
      "amount_token0": amountToken0.toStringAsFixed(0),
    };
    var encodedBody = jsonEncode(body);
    var result = await http.post(url, body: encodedBody, headers: header);
    print(result.body);
  }
}
