import 'package:flutter/cupertino.dart';
import 'package:park_mobil/app/app.locator.dart';
import 'package:park_mobil/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginPageViewModel extends BaseViewModel {
  TextEditingController emialController = TextEditingController();
  final _navigationService = locator<NavigationService>();
  navigateTo() {
    _navigationService.navigateTo(Routes.anasayfa);
  }
}
