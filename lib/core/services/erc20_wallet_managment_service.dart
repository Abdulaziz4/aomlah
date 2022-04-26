import 'dart:convert';
import 'package:aomlah/core/app/logger.dart';
import 'package:aomlah/core/enums/crypto_types.dart';
import 'package:aomlah/core/enums/token_addresses.dart';
import 'package:aomlah/core/models/unconfirmed_transaction.dart';
import 'package:aomlah/core/models/uni_real_time_wallet.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../models/bat_real_time_wallet.dart';
import '../models/realtime_wallet.dart';
import '../models/unconfirmed_erc20_transaction.dart';
import '../models/usdt_real_time_wallet.dart';

class Erc20WalletManagmentService {
  final _logger = getLogger("ErC20WalletManagmentService");
  final Map<String, String> header = {
    "Content-type": "application/json",
    "Accept": "application/json"
  };
  static final baseUrl = dotenv.env['WEB3_API_URL'] ?? "";

  Future<RealTimeWallet> getERC20WalletBalance(
      String address, String tokenAddress) async {
    _logger.i("getETHWalletInfo | args: address=$address");
    Uri url = Uri.parse("$baseUrl/$tokenAddress/balance");
    Map<String, dynamic> body = {'address': address};
    final result =
        await http.post(url, body: json.encode(body), headers: header);

    print(result.body);
    final wallet = initRealTimeWallet(jsonDecode(result.body), tokenAddress);

    return wallet;
  }

  RealTimeWallet initRealTimeWallet(jsonDecode, String tokenAddress) {
    if (tokenAddress == TokenAddresses.usdtTokenAddress) {
      return UsdtRealTimeWallet.fromJson(jsonDecode);
    } else if (tokenAddress == TokenAddresses.uniTokenAddress) {
      return UniRealTimeWallet.fromJson(jsonDecode);
    } else if (tokenAddress == TokenAddresses.batTokenAddress) {
      return BatRealTimeWallet.fromJson(jsonDecode);
    } else {
      return RealTimeWallet(address: "000000000000000000000000", balance: 0);
    }
  }

  Future<UnconfirmedTransaction> sendTransaction(
      String from, String to, amount, tokenAddress) async {
    _logger.i("transaction | to=$to");
    Uri url = Uri.parse("$baseUrl/fees");

    var result = await http.get(url, headers: header);
    var fees = jsonDecode(result.body);
    Map<String, dynamic> tx = {
      "from": from,
      "to": to,
      "value": amount,
      "fees": int.parse(fees['max_fee']),
    };
    UnconfirmedERC20Transaction erc20transaction =
        UnconfirmedERC20Transaction.fromJson(tx);

    return erc20transaction;
  }

  Future<void> sendSignedTransaction(
      Map<String, dynamic> signedJson, CryptoTypes types) async {
    String tokenAddress = getTokenAddress(types);
    print(signedJson);
    var encodedJson = jsonEncode(signedJson);
    Uri url = Uri.parse("$baseUrl/tx/$tokenAddress/send");

    var result = await http.post(url, body: encodedJson, headers: header);
    print(result.body);
  }

  String getTokenAddress(CryptoTypes types) {
    if (types == CryptoTypes.usdt) {
      return TokenAddresses.usdtTokenAddress;
    } else if (types == CryptoTypes.uni) {
      return TokenAddresses.uniTokenAddress;
    } else if (types == CryptoTypes.bat) {
      return TokenAddresses.batTokenAddress;
    } else {
      return 'UnSupported Token';
    }
  }
}
