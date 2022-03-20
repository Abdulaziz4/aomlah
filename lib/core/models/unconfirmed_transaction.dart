import 'package:aomlah/core/models/wallet.dart';
import 'package:ecdsa/ecdsa.dart';
import 'package:elliptic/elliptic.dart';

import '../app/utils/currency_helper.dart';
import '../enums/crypto_types.dart';

class UnconfirmedTransaction {
  final String from;
  final String to;
  final int total;
  final int fees;
  final Map<String, dynamic> tJson;
  final String toSign;

  UnconfirmedTransaction({
    required this.from,
    required this.to,
    required this.total,
    required this.fees,
    required this.tJson,
    required this.toSign,
  });
  factory UnconfirmedTransaction.fromJson(Map<String, dynamic> json) {
    return UnconfirmedTransaction(
      tJson: json,
      from: (((json['tx']['inputs'] as List)[0]['addresses'] as List))[0],
      to: (((json['tx']['outputs'] as List)[0]['addresses'] as List))[0],
      total: json['tx']['outputs'][0]['value'],
      fees: json['tx']['fees'],
      toSign: json['tosign'][0],
    );
  }

  String convertToWholeCoin(int total, CryptoTypes types) {
    if (types == CryptoTypes.bitcoin) {
      return CurrencyHelper.satsToBtc(total).toString();
    } else if (types == CryptoTypes.ethereum) {
      return CurrencyHelper.weiToETH(total).toString();
    } else {
      return "Cant Convert";
    }
  }

  Map<String, dynamic> signedTransaction(Wallet wallet) {
    Map<String, dynamic> signedJson = tJson;
    String privateKey = wallet.privateKey;
    var ec = getSecp256k1();

    final pr = PrivateKey.fromHex(ec, privateKey);
    var hash = List<int>.generate(toSign.length ~/ 2,
        (i) => int.parse(toSign.substring(i * 2, i * 2 + 2), radix: 16));

    var sig = signature(pr, hash);

    tJson['signatures'] = [sig.toDERHex()];
    tJson['pubkeys'] = [wallet.publicKey];

    return signedJson;
  }
}
