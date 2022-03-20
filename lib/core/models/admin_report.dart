class AdminReport {
  final int tradesNum;
  final int offersNum;
  final double totalTradedValue;
  AdminReport({
    required this.tradesNum,
    required this.offersNum,
    required this.totalTradedValue,
  });

  AdminReport copyWith({
    int? tradesNum,
    int? offersNum,
    double? totalTradedValue,
  }) {
    return AdminReport(
      tradesNum: tradesNum ?? this.tradesNum,
      offersNum: offersNum ?? this.offersNum,
      totalTradedValue: totalTradedValue ?? this.totalTradedValue,
    );
  }

  factory AdminReport.fromJson(Map<String, dynamic> map) {
    return AdminReport(
      tradesNum: map['trades_count']?.toInt() ?? 0,
      offersNum: map['offers_count']?.toInt() ?? 0,
      totalTradedValue: map['total_trades_value']?.toDouble() ?? 0.0,
    );
  }

  @override
  String toString() =>
      'AdminReport(tradesNum: $tradesNum, offersNum: $offersNum, totalTradedValue: $totalTradedValue)';
}
