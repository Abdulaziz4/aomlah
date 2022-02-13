// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:aomlah/ui/views/settings/settings_update_profile_view.dart';
import 'package:aomlah/ui/views/settings/settings_view.dart';
import 'package:aomlah/ui/views/wallet/wallet_info_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../ui/views/auth/verify_account_promotion/verify_account_promotion_view.dart';
import '../../ui/views/auth/welcome/welcome_view.dart';
import '../../ui/views/create_offer/create_offer_view.dart';
import '../../ui/views/faucets/faucets_view.dart';
import '../../ui/views/navigation/navigation_view.dart';
import '../../ui/views/profile/profile_view.dart';
import '../../ui/views/startup/startup_view.dart';
import '../../ui/views/wallet/wallet_view.dart';

class Routes {
  static const String startupView = '/';
  static const String navigationView = '/navigation-view';
  static const String profileView = '/profile-view';
  static const String createOfferView = '/create-offer-view';
  static const String verifyAccountPromotionView =
      '/verify-account-promotion-view';
  static const String welcomeView = '/welcome-view';
  static const String walletView = '/wallet-view';
  static const String faucetsView = '/faucets-view';
  static const String settingsHome = '/settings-home';
  static const String updateProfile = '/settings-update-profile';
  static const String walletInfo = '/wallet-info-view';

  static const all = <String>{
    startupView,
    navigationView,
    profileView,
    createOfferView,
    verifyAccountPromotionView,
    welcomeView,
    walletView,
    faucetsView,
    settingsHome,
    updateProfile,
    walletInfo,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupView, page: StartupView),
    RouteDef(Routes.navigationView, page: NavigationView),
    RouteDef(Routes.profileView, page: ProfileView),
    RouteDef(Routes.createOfferView, page: CreateOfferView),
    RouteDef(Routes.verifyAccountPromotionView,
        page: VerifyAccountPromotionView),
    RouteDef(Routes.welcomeView, page: WelcomeView),
    RouteDef(Routes.walletView, page: WalletView),
    RouteDef(Routes.faucetsView, page: FaucetsView),
    RouteDef(Routes.settingsHome, page: SettingsHome),
    RouteDef(Routes.updateProfile, page: UpdateProfileView),
    RouteDef(Routes.walletInfo, page: WalletInfoView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const StartupView(),
        settings: data,
      );
    },
    NavigationView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const NavigationView(),
        settings: data,
      );
    },
    ProfileView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ProfileView(),
        settings: data,
      );
    },
    CreateOfferView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const CreateOfferView(),
        settings: data,
      );
    },
    VerifyAccountPromotionView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const VerifyAccountPromotionView(),
        settings: data,
      );
    },
    WelcomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const WelcomeView(),
        settings: data,
      );
    },
    WalletView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const WalletView(),
        settings: data,
      );
    },
    FaucetsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const FaucetsView(),
        settings: data,
      );
    },
    SettingsHome: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SettingsHome(),
        settings: data,
      );
    },
    UpdateProfileView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const UpdateProfileView(),
        settings: data,
      );
    },
    WalletInfoView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const WalletInfoView(),
        settings: data,
      );
    },
  };
}
