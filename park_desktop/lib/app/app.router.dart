// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../BottomNavigationBar/botttom_navigation_view.dart';
import '../HomPage/AddNewCar/add_new_car.dart';
import '../Intro/intro_main_page.dart';
import '../Login/login_view.dart';
import '../ParkingAreas/parking_area_sliver_view.dart';
import '../main.dart';
import '../splash_screen.dart';

class Routes {
  static const String mainClass = '/';
  static const String bottomNavigatonView = '/bottom-navigaton-view';
  static const String introMainPage = '/intro-main-page';
  static const String loginView = '/login-view';
  static const String splashScreen = '/splash-screen';
  static const String addNewCar = '/add-new-car';
  static const String parkingAreaSliverView = '/parking-area-sliver-view';
  static const all = <String>{
    mainClass,
    bottomNavigatonView,
    introMainPage,
    loginView,
    splashScreen,
    addNewCar,
    parkingAreaSliverView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.mainClass, page: MainClass),
    RouteDef(Routes.bottomNavigatonView, page: BottomNavigatonView),
    RouteDef(Routes.introMainPage, page: IntroMainPage),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.splashScreen, page: SplashScreen),
    RouteDef(Routes.addNewCar, page: AddNewCar),
    RouteDef(Routes.parkingAreaSliverView, page: ParkingAreaSliverView),
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
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LoginView(),
        settings: data,
      );
    },
    SplashScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SplashScreen(),
        settings: data,
      );
    },
    AddNewCar: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AddNewCar(),
        settings: data,
      );
    },
    ParkingAreaSliverView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ParkingAreaSliverView(),
        settings: data,
      );
    },
  };
}
