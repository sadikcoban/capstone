import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class YeniOtoparkViewModel extends BaseViewModel{
  List<File> fotograflar = [];
  TextEditingController adController = TextEditingController();
  TextEditingController aciklamaController = TextEditingController();
  TextEditingController adresController = TextEditingController();
  TextEditingController saatlikOtoparkUcretiController =
      TextEditingController();
  String sehir = "";
  String ilce = "";

    Future onModalReady() async {
    try {
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
