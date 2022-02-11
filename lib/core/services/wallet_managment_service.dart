import 'dart:convert';

import 'package:aomlah/core/app/api_keys.dart';
import 'package:aomlah/core/models/wallet.dart';
import 'package:http/http.dart' as http;

class WalletManagmentService {
  static const token = APIKeys.blockcypherKey;
  static const baseUrl = "https://api.blockcypher.com/v1/bcy/test";

  Future<dynamic> sendRequest({
    required String path,
    String? body,
  }) async {
    Uri url = Uri.parse("$baseUrl/$path?token=$token");
    final response = await http.post(url, body: body);
    final decodedRes = jsonDecode(response.body);
    return decodedRes;
  }

  Future<Wallet> createWallet(String uuid) async {
    final generatedKeys = await sendRequest(path: "addrs");
    Wallet wallet = Wallet.fromBlockchainJson(generatedKeys);
    final walletData = {
      "name": uuid,
      "addresses": [wallet.address]
    };

    await sendRequest(path: "wallets", body: jsonEncode(walletData));

    wallet.profileId = uuid;
    return wallet;
  }

  Future<void> fundMe(String address) async {
    Uri url = Uri.parse("$baseUrl/addrs?token=$token");
    final data = jsonEncode({"address": address, "amount": 1000000});
    await http.post(url, body: data);
  }
}
