import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:park_mobil/UI/StaticWidgets/padding_static_class.dart';
import 'package:park_mobil/UI/StaticWidgets/renkler.dart';
import 'package:park_mobil/UI/StaticWidgets/statik_texts.dart';

class StaticWidgetClass {
  // cihazın pixelliğine göre bir oran (I phone x e göre ayarlanmıştır. 2.75in sebebi odur.)
  static rateText(BuildContext context) {
    double rateText = MediaQuery.of(context).devicePixelRatio / 2.75;
    return rateText;
  }

  // Arka Plan rengi
  static const Color mainColor = Color(0xffF0F1F2);
  static const Color koyuMavi = Color(0xFF0051A9);
  static const Color griText = Color(0xFF7D7E80);
  static const Color sariRenk = Color(0xffFFA600);
  static const Color kirmiziRenk = Color(0xffDC000F);
  static const Color yesilRenk = Color(0xff2DBD3A);
  // Tüm textlerin genel fonksioynu
  static specialText(
      String? text,
      int maxLines,
      Color color,
      FontWeight fontWeight,
      double fontSize,
      double height,
      TextAlign textAlign,
      BuildContext context) {
    return Text(
      '$text',
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textScaleFactor:1,
      style: GoogleFonts.roboto(
        color: color,
        fontWeight: fontWeight,
        fontSize: Platform.isIOS ? fontSize * rateText(context) : fontSize,
        height: height,
      ),
      textAlign: textAlign,
    );
  }

  //  dynamic olarak iconnun fonksiyonunu döndürme
  static generalIconFunc(double width, double height, String asset,
      {Color? color}) {
    return color == null
        ? SvgPicture.asset(
            "assets/$asset.svg",
            height: height,
            width: width,
            cacheColorFilter: true,
          )
        : SvgPicture.asset(
            "assets/$asset.svg",
            height: height,
            width: width,
            color: color,
          );
  }

//  dynamic olarak iconnun fonksiyonunu döndürme
  static generalPngFunc(double width, double height, String asset) {
    return Image.asset(
      "images/$asset.png",
      width: width,
      height: height,
      fit: BoxFit.contain,
    );
  }

  static itemYazi(
      {required BuildContext context,
      required String? baslik,
      double fontSize = 17,
      Color color = const Color(0xFF707070),
      TextAlign textAlign = TextAlign.center,
      double horizontalPadding = 0,
      double verticalPadding = 0,
      int maxLine = 50}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding, horizontal: horizontalPadding),
      child: StaticWidgetClass.specialText(
        baslik,
        maxLine,
        color,
        FontWeight.w400,
        fontSize,
        1.06,
        textAlign,
        context,
      ),
    );
  }

  static daireFonksiyonu(Color color) {
    return Row(
      children: [
        Container(
          width: 16.0,
          height: 16.0,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        const SizedBox(
          width: 2,
        )
      ],
    );
  }

  static avatarIkonu(
    BuildContext context, {
    double height = 28,
    double width = 28,
    required String kisaIsim,
    Color yaziRengi = Colors.black,
    Color containerRengi = const Color(0xFFDCDEE0),
    String url = "",
    double disCap = 20,
    double icCap = 17,
  }) {
    if (url != "") {
      return CachedNetworkImage(
        imageUrl: url,
        errorWidget: (context, url, error) => const Icon(Icons.error),
        imageBuilder: (context, imageProvider) => Align(
          alignment: Alignment.center,
          child: Center(
            child: CircleAvatar(
              radius: disCap,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: icCap,
                backgroundImage: imageProvider,
                backgroundColor: StaticWidgetClass.mainColor,
              ),
            ),
          ),
        ),
      );
    } else {}
    return Padding(
      padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 20),
      child: Container(
        width: width,
        height: height,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: containerRengi),
        child: Padding(
          padding: EdgeInsets.all(height / 5),
          child: FittedBox(
            fit: BoxFit.contain,
            child: StaticWidgetClass.specialText(kisaIsim, 1, yaziRengi,
                FontWeight.w500, 15, 1, TextAlign.center, context),
          ),
        ),
      ),
    );
  }

  static baslikVeAciklama(
    BuildContext context,
    String titleName,
    String answer, {
    Color baslikRenk = const Color(0xFF707070),
    Color yaziRenk = Colors.black,
  }) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: StaticWidgetClass.specialText(titleName, 1, baslikRenk,
              FontWeight.w400, 15, 1.33, TextAlign.left, context),
        ),
        const SizedBox(
          height: 3,
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: StaticWidgetClass.specialText(answer, 1, yaziRenk,
              FontWeight.w400, 16, 1.25, TextAlign.left, context),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }

  static kalinBaslik(
      {required BuildContext context,
      required String baslik,
      double height = 18,
      Color color = Colors.black,
      FontWeight extraWeight = FontWeight.w600,
      TextAlign textAlign = TextAlign.left}) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: StaticWidgetClass.specialText(
              baslik, 1, color, extraWeight, height, 0.94, textAlign, context),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  static yanYanaYazilar({
    required BuildContext context,
    required String baslik,
    required String item,
    double height = 18,
    double fontSize = 0.94,
    Color colorBaslik = Colors.black,
    Color colorItem = Colors.black,
    FontWeight fontWeight = FontWeight.w500,
    double padding = 0,
    TextAlign text1Align = TextAlign.left,
    TextAlign text2Align = TextAlign.right,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: StaticWidgetClass.specialText(baslik, 1, colorBaslik,
                fontWeight, height, fontSize, text1Align, context),
          ),
          Expanded(
            child: StaticWidgetClass.specialText(item, 1, colorItem, fontWeight,
                height, fontSize, text2Align, context),
          ),
        ],
      ),
    );
  }

  static altAltaYazilar({
    required BuildContext context,
    required String baslik,
    required String item,
    required double space,
    double itemFont = 20,
    double baslikFont = 19.0,
    double height = 1,
    Color colorBaslik = Colors.black,
    Color colorItem = Colors.black,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StaticWidgetClass.specialText(
          baslik,
          1,
          colorBaslik,
          FontWeight.w400,
          baslikFont,
          height,
          TextAlign.start,
          context,
        ),
        SizedBox(
          height: space,
        ),
        StaticWidgetClass.specialText(
          item,
          1,
          colorItem,
          FontWeight.w400,
          itemFont,
          height,
          TextAlign.start,
          context,
        ),
      ],
    );
  }

  static ikonVeYazi({
    required BuildContext context,
    required Icon icon,
    required String baslik,
    double height = 15,
    Color color = Colors.grey,
    MainAxisAlignment alignment = MainAxisAlignment.center,
    double fontSize = 15,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: alignment,
      children: [
        icon,
        StaticWidgetClass.itemYazi(
          context: context,
          baslik: baslik,
          fontSize: fontSize,
          color: color,
        ),
      ],
    );
  }

  static butonTasarimi({
    required BuildContext context,
    required String baslik,
    Color color = const Color(0xFF17C9EB),
    bool isLoading = false,
  }) {
    return Container(
        alignment: const Alignment(0.0, 0.1),
        height: 52.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.16),
              offset: const Offset(0, 3.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: isLoading
            ? const Center(
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      StaticWidgetClass.koyuMavi,
                    ),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(5),
                child: StaticWidgetClass.specialText(
                  baslik,
                  1,
                  Colors.white,
                  FontWeight.w600,
                  18,
                  0.94,
                  TextAlign.center,
                  context,
                ),
              ));
  }

  static loginTextField(
      {required BuildContext context,
      required TextEditingController controller,
      required String hint,
      double height = 50,
      bool obscure = false,
      int limit = 10000,
      int maxLine = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StatikTexts.yaziText(
                text: hint,
                yaziRengi: Renkler.textPasif,
                size: 18,
                weight: FontWeight.bold,
                align: TextAlign.left),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.16),
                    offset: const Offset(0, 2.0),
                    blurRadius: 4.0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: TextField(
                  maxLines: maxLine,
                  // sicil no controller
                  controller: controller,
                  // giriş sadece numeric kalvye ile olacak
                  keyboardType: TextInputType.text,
                  // sitili
                  style: GoogleFonts.roboto(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  obscureText: obscure,
                  // dekorasyon
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      //  text tıklanmadığındaki rengi
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      //  Text tıklanınca rengi
                    ),
                    // alttan çizgi olacak
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static yukleniyorWidget() {
    return Material(
      color: Colors.grey.withOpacity(0.4),
      child: Center(
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitChasingDots(
                itemBuilder: (_, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: index.isEven
                          ? StaticWidgetClass.koyuMavi
                          : Colors.cyan,
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              StaticWidgetClass.generalIconFunc(30, 30, 'logo'),
            ],
          ),
        ),
      ),
    );
  }

  static ozelDinamikYazi({
    required String yazi,
    required BuildContext context,
  }) {
    return Padding(
      padding:
          EdgeInsets.only(left: PaddingStaticClass().allPaddingRate(context)),
      child: StaticWidgetClass.itemYazi(
          context: context, baslik: yazi, fontSize: 16, color: Colors.black),
    );
  }

  static snackBarMessage(
    String msg,
    Color backgroundColor,
    Color textColor, {
    icon = Icons,
  }) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Row(
        children: [
          Icon(
            icon,
            color: textColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            msg,
            style: TextStyle(color: textColor),
          ),
        ],
      ),
      backgroundColor: backgroundColor,
    );
  }

  static Widget checkBox(
      bool deger, Function onTap, BuildContext context, String baslik) {
    return GestureDetector(
      onTap: () => onTap,
      child: Row(
        children: [
          Checkbox(
            onChanged: (_) {
              onTap();
            },
            value: deger,
            checkColor: Colors.white,
            activeColor: StaticWidgetClass.koyuMavi,
          ),
          StaticWidgetClass.specialText(baslik, 1, Colors.black,
              FontWeight.w500, 18, 1, TextAlign.left, context),
        ],
      ),
    );
  }
}
