import 'package:aomlah/core/models/unconfirmed_transaction.dart';
import 'package:aomlah/core/models/wallet.dart';

class UnconfirmedERC20Transaction extends UnconfirmedTransaction {
  UnconfirmedERC20Transaction(
      {required String from,
      required String to,
      required int total,
      required int fees,
      required Map<String, dynamic> tJson,
      required String toSign})
      : super(
            from: from,
            to: to,
            total: total,
            fees: fees,
            tJson: tJson,
            toSign: toSign);

  factory UnconfirmedERC20Transaction.fromJson(Map<String, dynamic> json) {
    return UnconfirmedERC20Transaction(
        from: json["from"],
        to: json["to"],
        total: json["value"],
        fees: json["fees"],
        tJson: json,
        toSign: "");
  }

  @override
  Map<String, dynamic> signedTransaction(Wallet wallet) {
    Map<String, dynamic> tx = {
      "from": from,
      "to": to,
      "amount": total,
      "private": wallet.privateKey
    };
    return tx;
  }
}
