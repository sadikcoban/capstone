import 'package:flutter/material.dart';

class PaddingStaticClass {
  // padding oranı
  static const double paddingRate = 4.44;
  // padding döndürme fonksiyonu
  allPaddingRate(BuildContext context) {
    // padding oranı ve dündürme
    return MediaQuery.of(context).size.width / 22.5;
  }

  getAllHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  getAllWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}