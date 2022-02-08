import 'dart:convert';

import 'package:aomlah/core/models/wallet.dart';
import 'package:http/http.dart' as http;

class WalletService {
  static const token = "14409c2675354b03924f8889e6bcd60c";
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
}
