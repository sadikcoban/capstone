import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:park_desktop/Intro/intro_main_page.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';

import 'app/app.locator.dart';
import 'app/app.router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    runApp(MaterialApp(
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        SfGlobalLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('tr'),
      ],
      locale: const Locale('tr'),
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget!),
        maxWidth: 5000,
        minWidth: 800,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(450, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          const ResponsiveBreakpoint.resize(1800, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(1920, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
      ),
      title: 'Otopark Yönetim',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffF0F1F2),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: true,
        ),
        canvasColor: Colors.transparent,
        hintColor: Colors.white,
      ),
      home: const MainClass(),
    ));
  });
}

class MainClass extends StatelessWidget {
  const MainClass({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: IntroMainPage());
  }
}
