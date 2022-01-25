// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../ui/views/offers_discovery/offers_discovery_view.dart';
import '../../ui/views/startup/startup_view.dart';

class Routes {
  static const String startupView = '/';
  static const String offersDiscoveryView = '/offers-discovery-view';
  static const all = <String>{
    startupView,
    offersDiscoveryView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupView, page: StartupView),
    RouteDef(Routes.offersDiscoveryView, page: OffersDiscoveryView),
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
    OffersDiscoveryView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const OffersDiscoveryView(),
        settings: data,
      );
    },
  };
}
