import 'package:aomlah/core/enums/dispute_status.dart';
import 'package:aomlah/core/models/trade.dart';

class Dispute {
  final String disputeId;
  final String cause;
  final DisputeStatus status;
  final String tradeId;
  final String openerId;
  final Trade? trade;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  Dispute({
    required this.disputeId,
    required this.cause,
    required this.status,
    required this.tradeId,
    required this.openerId,
    this.trade,
    this.createdAt,
    this.updatedAt,
  });

  factory Dispute.dummy() {
    return Dispute(
      disputeId: "",
      cause: "",
      status: DisputeStatus.waiting,
      tradeId: "",
      openerId: "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dispute_id': disputeId,
      'cause': cause,
      'status': status.name,
      'trade_id': tradeId,
      'opener_id': openerId,
    };
  }

  factory Dispute.fromJson(Map<String, dynamic> json) {
    return Dispute(
      disputeId: json['dispute_id'] ?? '',
      cause: json['cause'] ?? '',
      status: DisputeStatus.values.firstWhere(
        (status) => status.name == json["status"],
        orElse: () => DisputeStatus.waiting,
      ),
      tradeId: json['trade_id'] ?? '',
      openerId: json['opener_id'] ?? '',
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : DateTime.now(),
      updatedAt: json["updated_at"] != null
          ? DateTime.tryParse(json['updated_at'])
          : DateTime.now(),
      trade: json["trade"] != null ? Trade.fromJson(json["trade"]) : null,
    );
  }
  Dispute copyWith({
    String? disputeId,
    String? cause,
    DateTime? createdAt,
    DisputeStatus? status,
    String? tradeId,
    String? openerId,
  }) {
    return Dispute(
      disputeId: disputeId ?? this.disputeId,
      cause: cause ?? this.cause,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
      tradeId: tradeId ?? this.tradeId,
      openerId: openerId ?? this.openerId,
    );
  }

  String getStatusLabel() {
    switch (status) {
      case DisputeStatus.waiting:
        return "في الانتظار";
      case DisputeStatus.closed:
        return "مغلق";
    }
  }
}
