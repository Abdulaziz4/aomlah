import 'package:aomlah/core/enums/crypto_types.dart';

import '../services/realtime_wallet.dart';

class WalletInfo {
  final RealTimeWallet wallet;
  final String cryptoType;
  final CryptoTypes types;
  double? walletBalance;
  double? realTimePrice;
  double? walletBalanceSAR;
  WalletInfo({
    required this.wallet,
    required this.types,
    required this.cryptoType,
    this.walletBalance,
    this.realTimePrice,
    this.walletBalanceSAR,
  });
}
