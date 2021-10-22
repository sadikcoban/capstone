// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../BottomNavigationBar/botttom_navigation_view.dart';
import '../Intro/intro_main_page.dart';
import '../main.dart';

class Routes {
  static const String mainClass = '/';
  static const String bottomNavigatonView = '/bottom-navigaton-view';
  static const String introMainPage = '/intro-main-page';
  static const all = <String>{
    mainClass,
    bottomNavigatonView,
    introMainPage,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.mainClass, page: MainClass),
    RouteDef(Routes.bottomNavigatonView, page: BottomNavigatonView),
    RouteDef(Routes.introMainPage, page: IntroMainPage),
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
    BottomNavigatonView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const BottomNavigatonView(),
        settings: data,
      );
    },
    IntroMainPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const IntroMainPage(),
        settings: data,
      );
    },
  };
}
