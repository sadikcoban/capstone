// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../UI/Anasayfa/anasayfa_view.dart';
import '../UI/ParkAlani/Parklar/parklar_view.dart';
import '../UI/ParkAlani/YeniOtopark/yeni_otopark.dart';
import '../UI/ParkAlani/park_alani_view.dart';
import '../UI/Rezervasyon/rezervasyon_view.dart';
import '../main.dart';

class Routes {
  static const String mainClass = '/';
  static const String anasayfa = '/Anasayfa';
  static const String rezervasyon = '/Rezervasyon';
  static const String parkAlaniView = '/park-alani-view';
  static const String parklarView = '/parklar-view';
  static const String yeniOtopark = '/yeni-otopark';
  static const all = <String>{
    mainClass,
    anasayfa,
    rezervasyon,
    parkAlaniView,
    parklarView,
    yeniOtopark,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.mainClass, page: MainClass),
    RouteDef(Routes.anasayfa, page: Anasayfa),
    RouteDef(Routes.rezervasyon, page: Rezervasyon),
    RouteDef(Routes.parkAlaniView, page: ParkAlaniView),
    RouteDef(Routes.parklarView, page: ParklarView),
    RouteDef(Routes.yeniOtopark, page: YeniOtopark),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    MainClass: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const MainClass(),
        settings: data,
      );
    },
    Anasayfa: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const Anasayfa(),
        settings: data,
      );
    },
    Rezervasyon: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const Rezervasyon(),
        settings: data,
      );
    },
    ParkAlaniView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ParkAlaniView(),
        settings: data,
      );
    },
    ParklarView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ParklarView(),
        settings: data,
      );
    },
    YeniOtopark: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const YeniOtopark(),
        settings: data,
      );
    },
  };
}
