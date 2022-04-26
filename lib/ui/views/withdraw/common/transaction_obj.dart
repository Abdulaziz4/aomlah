import 'package:aomlah/core/enums/crypto_types.dart';

import '../../../../core/models/unconfirmed_transaction.dart';

class TransactionObj {
  final UnconfirmedTransaction transaction;
  final CryptoTypes types;

  TransactionObj(this.transaction, this.types);

  String cryptoType() {
    if (types == CryptoTypes.bitcoin) {
      return 'BTC';
    } else if (types == CryptoTypes.ethereum) {
      return 'ETH';
    } else if (types == CryptoTypes.usdt) {
      return 'USDT';
    } else if (types == CryptoTypes.uni) {
      return 'UNI';
    } else if (types == CryptoTypes.bat) {
      return 'BAT';
    } else {
      return 'NaN';
    }
  }
}
