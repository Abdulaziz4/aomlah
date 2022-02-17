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
      from: (json['tx']['addresses'] as List)[0],
      to: (json['tx']['addresses'] as List)[1],
      total: json['tx']['total'],
      fees: json['tx']['fees'],
      toSign: json['tosign'][0],
    );
  }
  String satsToBTC(int sats) {
    double n = sats * 0.00000001;
    return '$n';
  }
}
