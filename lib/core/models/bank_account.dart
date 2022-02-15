import 'dart:convert';

class BankAccount {
  final String iban;
  final String ownerName;
  final String bankName;

  BankAccount({
    required this.iban,
    required this.ownerName,
    required this.bankName,
  });

  Map<String, dynamic> toMap() {
    return {
      'iban': iban,
      'owner_name': ownerName,
      'bank_name': bankName,
    };
  }

  factory BankAccount.fromMap(Map<String, dynamic> map) {
    return BankAccount(
      iban: map['iban'] ?? '',
      ownerName: map['owner_name'] ?? '',
      bankName: map['bank_name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BankAccount.fromJson(String source) =>
      BankAccount.fromMap(json.decode(source));
}
