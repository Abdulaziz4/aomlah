class Wallet {
  final String privateKey;
  final String publicKey;
  final String address;
  String? profileId;
  Wallet({
    required this.privateKey,
    required this.publicKey,
    required this.address,
    this.profileId,
  });

  factory Wallet.empty() => Wallet(privateKey: "", publicKey: "", address: "");

  Map<String, dynamic> toJson() {
    return {
      'private_key': privateKey,
      'public_key': publicKey,
      'address': address,
      "profile_id": profileId,
    };
  }

  factory Wallet.fromJson(Map<String, dynamic> map) {
    return Wallet(
        privateKey: map['private_key'] ?? '',
        publicKey: map['public_key'] ?? '',
        address: map['address'] ?? '',
        profileId: map["profile_id"]);
  }

  factory Wallet.fromBlockchainJson(Map<String, dynamic> json) {
    return Wallet(
      privateKey: json['private'] ?? '',
      publicKey: json['public'] ?? '',
      address: json['address'] ?? '',
    );
  }
}
