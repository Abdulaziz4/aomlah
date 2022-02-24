import 'dart:convert';
import 'package:ecdsa/ecdsa.dart';
import 'package:elliptic/elliptic.dart';
import 'package:aomlah/core/app/api_keys.dart';
import 'package:aomlah/core/app/logger.dart';
import 'package:aomlah/core/models/real_time_wallet.dart';
import 'package:aomlah/core/models/unconfirmed_transaction.dart';
import 'package:aomlah/core/models/wallet.dart';
import 'package:http/http.dart' as http;
import 'package:stacked_services/stacked_services.dart';

import '../models/eth_real_time_wallet.dart';

enum HttpVreb {
  post,
  get,
}

class EthWalletManagmentService {
  final _logger = getLogger("ETHWalletManagmentService");

  static const token = APIKeys.blockcypherKeyEth;
  static const baseUrl = "https://api.blockcypher.com/v1/beth/test";

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

  ///done
  Future<Wallet> createWallet(String uuid) async {
    _logger.i("createETHWallet | args: uuid = $uuid");

    final generatedKeys = await sendRequest(path: "addrs", req: HttpVreb.post);

    Wallet wallet = Wallet.fromBlockchainJson(generatedKeys);
    final walletData = {
      "name": uuid,
      "addresses": [wallet.address]
    };

    // await sendRequest(
    //     path: "wallets", body: jsonEncode(walletData), req: HttpVreb.post);

    wallet.profileId = uuid;
    return wallet;
  }

  Future<void> fundMe(String address) async {
    _logger.i("fundMeEth | args: address=$address");

    Uri url = Uri.parse("$baseUrl/faucet?token=$token");
    final data = jsonEncode({"address": address, "amount": 10000000000000000});
    var m = await http.post(url, body: data);
    print(jsonDecode(m.body));
  }

  Future<UnconfirmedTransaction> sendTransaction(
      String from, String to, amount) async {
    _logger.i("transaction | to=$to");
    Uri url = Uri.parse("$baseUrl/txs/new?token=$token");
    final data = {
      "inputs": [
        {
          "addresses": [from]
        }
      ],
      "outputs": [
        {
          "addresses": [to],
          "value": amount
        }
      ]
    };
    var m = await http.post(url, body: jsonEncode(data));
    UnconfirmedTransaction trs =
        UnconfirmedTransaction.fromJson(jsonDecode(m.body));
    return trs;
  }

  Future<EthRealTimeWallet> getWalletInfo(String address) async {
    _logger.i("getETHWalletInfo | args: address=$address");

    final response = await sendRequest(
      path: "addrs/$address/full",
      includeToken: false,
      req: HttpVreb.get,
    );
    final wallet = EthRealTimeWallet.fromJson(response);

    return wallet;
  }

  Future<void> sendSignedTransaction(Map<String, dynamic> signedJson) async {
    print(signedJson);
    var encodedJson = jsonEncode(signedJson);
    Uri url = Uri.parse("$baseUrl/txs/send?token=$token");

    var m = await http.post(url, body: encodedJson);
    print(m.body);
  }
}
