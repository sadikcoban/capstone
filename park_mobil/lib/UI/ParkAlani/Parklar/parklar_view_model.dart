import 'package:flutter/cupertino.dart';
import 'package:park_mobil/app/app.locator.dart';
import 'package:park_mobil/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ParklarViewModel extends BaseViewModel {
  late ScrollController scrollController =
      ScrollController();

  Future onModalReady() async {
    try {
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  final _navigationService = locator<NavigationService>();
  int currentIndex = 0;
  navigateTo() {
    _navigationService.navigateTo(Routes.yeniOtopark);
    notifyListeners();
  }
}
