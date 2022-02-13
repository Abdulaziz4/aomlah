class Transaction {
  final String from;
  final String to;
  final int total;
  final int fees;
  final DateTime confirmedDate;

  Transaction({
    required this.from,
    required this.to,
    required this.total,
    required this.fees,
    required this.confirmedDate,
  });
  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      from: (json['addresses'] as List)[0],
      to: (json['addresses'] as List)[1],
      total: json['total'],
      fees: json['fees'],
      confirmedDate: DateTime.parse(json['confirmedDate']),
    );
  }
}
