import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:park_desktop/app/app.locator.dart';
import 'package:park_desktop/app/app.router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class IntroViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  navigateTo() {
    splashScreenPassed();
    _navigationService.navigateTo(Routes.bottomNavigatonView);
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  splashScreenPassed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('splash', 1);
  }
}
