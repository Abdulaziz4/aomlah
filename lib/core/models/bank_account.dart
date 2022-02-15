import 'dart:convert';

class BankAccount {
  final String iban;
  final String ownerName;
  final String bankName;
  final String profileId;

  BankAccount({
    required this.iban,
    required this.ownerName,
    required this.bankName,
    required this.profileId,
  });

  Map<String, dynamic> toJson() {
    return {
      'iban': iban,
      'owner_name': ownerName,
      'bank_name': bankName,
      "profile_id": profileId,
    };
  }

  factory BankAccount.fromJson(Map<String, dynamic> map) {
    return BankAccount(
      iban: map['iban'] ?? '',
      ownerName: map['owner_name'] ?? '',
      bankName: map['bank_name'] ?? '',
      profileId: map['profile_id'] ?? '',
    );
  }

  String ibanLabel() => "SA " + iban;
}
