import 'package:aomlah/core/models/bank_account.dart';
import 'package:aomlah/core/models/wallet.dart';

class AomlahUser {
  final String profileId;
  final String name;
  final bool isVerified;
  final Wallet? wallet;
  final Wallet? walletETH;
  final double debt;
  final List<BankAccount> bankAccounts;
  final bool isOnline;
  final bool isAdmin;
  AomlahUser({
    required this.profileId,
    required this.name,
    required this.isVerified,
    required this.bankAccounts,
    required this.wallet,
    required this.walletETH,
    required this.isOnline,
    required this.debt,
    this.isAdmin = false,
  });

  factory AomlahUser.anonymous() {
    return AomlahUser(
      profileId: "",
      name: "",
      isVerified: false,
      bankAccounts: [],
      wallet: Wallet(address: "", privateKey: "", publicKey: ""),
      walletETH: Wallet(address: "", privateKey: "", publicKey: ""),
      isOnline: false,
      debt: 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'profile_id': profileId,
      'name': name,
      'is_verified': isVerified,
      'is_online': isOnline,
    };
  }

  factory AomlahUser.fromJson(Map<String, dynamic> map) {
    List<BankAccount> accounts = [];
    if ((map["bank_accounts"] as List).first != null) {
      accounts = (map["bank_accounts"] as List).map((e) {
        return BankAccount.fromJson(e);
      }).toList();
    }
    return AomlahUser(
      profileId: map['profile_id'] ?? '',
      name: map['name'] ?? '',
      isVerified: map['is_verified'] ?? false,
      wallet: map["wallet"] == null ? null : Wallet.fromJson(map['wallet']),
      walletETH:
          map["eth_wallet"] == null ? null : Wallet.fromJson(map['eth_wallet']),
      bankAccounts: accounts,
      isOnline: map['is_online'] ?? false,
      isAdmin: map["is_admin"] ?? false,
      debt: map["debt"] * 1.0,
    );
  }
}
