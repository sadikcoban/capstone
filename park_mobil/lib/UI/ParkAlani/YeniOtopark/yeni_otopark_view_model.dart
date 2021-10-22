import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:park_mobil/app/app.locator.dart';
import 'package:park_mobil/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class YeniOtoparkViewModel extends BaseViewModel {
  ScrollController otoparkDetaylariScrollController = ScrollController();
  List<File> fotograflar = [];
  TextEditingController adController = TextEditingController();
  TextEditingController aciklamaController = TextEditingController();
  TextEditingController adresController = TextEditingController();
  TextEditingController saatlikOtoparkUcretiController =
      TextEditingController();
  String sehir = "";
  String ilce = "";
  String mahalle = "";

  Future onModalReady() async {
    try {
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  onChangedSehir(String? value) {
    sehir = value!;
  }

  onchangedIlce(String? value) {
    ilce = value!;
  }

  onchangedMahalle(String? value) {
    mahalle = value!;
  }
    final _navigationService = locator<NavigationService>();
  int currentIndex = 0;
  navigateTo() {
    _navigationService.navigateTo(Routes.parkAlaniView);
    notifyListeners();
  }
}
