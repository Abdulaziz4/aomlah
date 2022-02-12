import 'dart:convert';

import 'package:aomlah/core/models/bank_account.dart';
import 'package:aomlah/core/models/wallet.dart';

class AomlahUser {
  final String profileId;
  final String name;
  final bool isVerified;
  final Wallet? wallet;
  final List<BankAccount> bankAccounts;
  final bool isOnline;
  AomlahUser({
    required this.profileId,
    required this.name,
    required this.isVerified,
    required this.bankAccounts,
    required this.wallet,
    required this.isOnline,
  });

  factory AomlahUser.anonymous() {
    return AomlahUser(
      profileId: "",
      name: "",
      isVerified: false,
      bankAccounts: [],
      wallet: Wallet(address: "", privateKey: "", publicKey: ""),
      isOnline: false,
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
      accounts = (map["bank_accounts"] as List)
          .map((e) => BankAccount.fromJson(e))
          .toList();
    }
    return AomlahUser(
      profileId: map['profile_id'] ?? '',
      name: map['name'] ?? '',
      isVerified: map['is_verified'] ?? false,
      wallet: map["wallet"] == null ? null : Wallet.fromJson(map['wallet']),
      bankAccounts: accounts,
      isOnline: map['is_online'] ?? false,
    );
  }
}
