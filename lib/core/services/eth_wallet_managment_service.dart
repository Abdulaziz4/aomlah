import 'dart:convert';
import 'package:aomlah/core/app/api_keys.dart';
import 'package:aomlah/core/app/logger.dart';
import 'package:aomlah/core/models/unconfirmed_erc20_transaction.dart';
import 'package:aomlah/core/models/unconfirmed_transaction.dart';
import 'package:aomlah/core/models/wallet.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../enums/http_verbs.dart';
import '../models/eth_real_time_wallet.dart';

class EthWalletManagmentService {
  final _logger = getLogger("ETHWalletManagmentService");

  final Map<String, String> header = {
    "Content-type": "application/json",
    "Accept": "application/json"
  };

  static String token = APIKeys.blockcypherKeyEth;
  static const baseUrl = "https://api.blockcypher.com/v1/beth/test";
  static final baseUrlWeb3 =
      // "http://10.0.2.2:8080/api/v1/web3";
      dotenv.env['WEB3_API_URL'] ?? "";
  Future<dynamic> sendRequest({
    required String path,
    required HttpVreb req,
    String? body,
    bool includeToken = true,
  }) async {
    Uri url =
        Uri.parse("$baseUrl/$path" + (includeToken ? "?token=$token" : ""));
    late Future request;
    switch (req) {
      case HttpVreb.post:
        request = http.post(url, body: body);
        break;
      case HttpVreb.get:
        request = http.get(url);
        break;
    }
    final response = await request;
    final decodedRes = jsonDecode(response.body);
    return decodedRes;
  }

  Future<Wallet> createWallet(String uuid) async {
    _logger.i("createETHWallet | args: uuid = $uuid");

    final generatedKeys = await sendRequest(path: "addrs", req: HttpVreb.post);

    Wallet wallet = Wallet.fromBlockchainJson(generatedKeys);

    wallet.profileId = uuid;
    return wallet;
  }

  Future<void> fundMe(String address) async {
    _logger.i("fundMeEth | args: address=$address");

    Uri url = Uri.parse("$baseUrl/faucet?token=$token");
    final data = jsonEncode({"address": address, "amount": 10000000000000000});
    await http.post(url, body: data);
  }

  Future<UnconfirmedTransaction> sendTransaction(
      String from, String to, amount) async {
    _logger.i("transaction | to=$to");

    if (from.substring(0, 2) != "0x") {
      from = "0x$from";
    }
    if (to.substring(0, 2) != "0x") {
      to = "0x$to";
    }
    Uri url = Uri.parse("$baseUrlWeb3/tx");
    Map<String, dynamic> tx = {
      "from": from,
      "to": to,
      "amount": amount,
    };
    var m = await http.post(url, body: jsonEncode(tx), headers: header);

    UnconfirmedTransaction trs =
        UnconfirmedERC20Transaction.fromJson(jsonDecode(m.body));
    return trs;
  }

  Future<EthRealTimeWallet> getWalletInfo(String address) async {
    _logger.i("getETHWalletInfo | args: address=$address");

    if (address.substring(0, 2) != "0x") {
      address = "0x$address";
    }

    Uri url = Uri.parse("$baseUrlWeb3/address/$address/balance");

    final result = await http.get(url, headers: header);
    print(result.body);
    var resultF = jsonDecode(result.body);
    print(resultF);
    final wallet = EthRealTimeWallet.fromJson(resultF);

    return wallet;
  }

  Future<void> sendSignedTransaction(Map<String, dynamic> signedJson) async {
    _logger.i("sendSignedTransaction | signedJson=$signedJson");
    print(signedJson);
    var encodedJson = jsonEncode(signedJson);
    Uri url = Uri.parse("$baseUrlWeb3/tx/send");

    await http.post(url, body: encodedJson, headers: header);
  }
}
