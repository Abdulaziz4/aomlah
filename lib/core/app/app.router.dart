// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../ui/views/create_offer/create_offer_view.dart';
import '../../ui/views/navigation/navigation_view.dart';
import '../../ui/views/profile/profile_view.dart';
import '../../ui/views/startup/startup_view.dart';

class Routes {
  static const String startupView = '/';
  static const String navigationView = '/navigation-view';
  static const String profileView = '/profile-view';
  static const String createOfferView = '/create-offer-view';
  static const all = <String>{
    startupView,
    navigationView,
    profileView,
    createOfferView,
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
  };
}
