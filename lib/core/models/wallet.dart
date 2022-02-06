import 'dart:convert';

class Wallet {
  final String privateKey;
  final String publicKey;
  final String address;

  Wallet({
    required this.privateKey,
    required this.publicKey,
    required this.address,
  });

  factory Wallet.empty() => Wallet(privateKey: "", publicKey: "", address: "");
  Map<String, dynamic> _toMap() {
    return {
      'private_key': privateKey,
      'public_key': publicKey,
      'address': address,
    };
  }

  factory Wallet._fromMap(Map<String, dynamic> map) {
    return Wallet(
      privateKey: map['private_key'] ?? '',
      publicKey: map['public_key'] ?? '',
      address: map['address'] ?? '',
    );
  }

  String toJson() => json.encode(_toMap());

  factory Wallet.fromJson(String source) =>
      Wallet._fromMap(json.decode(source));
}
