import 'package:aomlah/core/enums/crypto_types.dart';

import '../../../../core/models/unconfirmed_transaction.dart';

class TransactionObj {
  final UnconfirmedTransaction transaction;
  final CryptoTypes types;

  TransactionObj(this.transaction, this.types);

  String cryptoType() {
    if (types == CryptoTypes.btc) {
      return 'BTC';
    } else {
      return 'ETH';
    }
  }
}
