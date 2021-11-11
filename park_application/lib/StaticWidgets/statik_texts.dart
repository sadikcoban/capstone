import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'renkler.dart';

class StatikTexts {
  static yaziText({
    required String text,
    Color yaziRengi = const Color(0xFF354052),
    FontWeight weight = FontWeight.w600,
    double size = 14,
    align = TextAlign.start,
  }) {
    return Builder(builder: (context) {
      return Text(
        text,
        textAlign: align,
        maxLines: 100,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.lato(
          fontSize: size,
          color: yaziRengi,
          fontWeight: weight,
        ),
        textScaleFactor: 1,
      );
    });
  }

  static ikonVeText(
      {required ikonColor,
      required textColor,
      required String yazi,
      required IconData icon}) {
    return Row(
      children: [
        Icon(
          icon,
          color: ikonColor,
        ),
        const SizedBox(
          width: 10,
        ),
        yaziText(text: yazi, yaziRengi: textColor),
      ],
    );
  }

  static sayfaIsmi({required String sayfaAdi, required String aciklama}) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StatikTexts.yaziText(text: sayfaAdi, size: 35),
          StatikTexts.yaziText(text: aciklama, yaziRengi: Renkler.ikonPasif),
        ],
      ),
    );
  }

  static baslikVeYazi({required String sayfaAdi, required String aciklama}) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StatikTexts.yaziText(
              text: sayfaAdi, size: 12, yaziRengi: Renkler.textAktif),
          StatikTexts.yaziText(
              text: aciklama, yaziRengi: Colors.black, size: 14),
        ],
      ),
    );
  }

  static yanYanaYazi({required String sayfaAdi, required String aciklama}) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StatikTexts.yaziText(
              text: sayfaAdi, size: 12, yaziRengi: Renkler.textAktif),
          StatikTexts.yaziText(
              text: aciklama,
              yaziRengi: Colors.black,
              size: 14,
              weight: FontWeight.w900),
        ],
      ),
    );
  }

  static hizliBakis(
      {required String baslik,
      required String aciklama,
      required BuildContext context,
      required bool yukesliyorMu,
      required Color noktaRengi}) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Container(
        alignment: Alignment.center,
        height: 110,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90), color: noktaRengi),
              height: 15,
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                yaziText(text: baslik),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    yaziText(
                        text: aciklama,
                        size: 30,
                        weight: FontWeight.w800,
                        yaziRengi: Colors.black),
                    const SizedBox(width: 10),
                    SvgPicture.asset(yukesliyorMu
                        ? "assets/increase.svg"
                        : "assets/decrease.svg"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static kullaniciBilgileri(
      {required String isimSoyisim,
      required String araba,
      required String tarih,
      required String zaman,
      required String otoparkBolumu,
      required Color disRenk}) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        alignment: Alignment.centerLeft,
        height: 210,
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0), color: disRenk),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StatikTexts.yaziText(
                          text: isimSoyisim, weight: FontWeight.w900, size: 16),
                      const SizedBox(
                        height: 30,
                      ),
                      StatikTexts.baslikVeYazi(
                          sayfaAdi: "Araba Modeli", aciklama: araba),
                      const SizedBox(
                        height: 15,
                      ),
                      StatikTexts.baslikVeYazi(
                          sayfaAdi: "Otopark Bölümü", aciklama: otoparkBolumu),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: Image.asset(
                      "assets/car.png",
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StatikTexts.baslikVeYazi(sayfaAdi: "Tarih", aciklama: tarih),
                  StatikTexts.baslikVeYazi(sayfaAdi: "Zaman", aciklama: zaman),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static dropDownString(
      {required String labelText,
      required List<String> liste,
      required String secilenItem,
      required Function(String?) onchanged}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: DropdownSearch<String>(
        mode: Mode.DIALOG,
        dropdownSearchDecoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
              color: Renkler.ikonAktif,
              fontSize: 18,
              fontWeight: FontWeight.bold),
          filled: true,
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF01689A)),
          ),
        ),
        showAsSuffixIcons: true,
        clearButtonBuilder: (_) => const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.clear,
            size: 24,
            color: Colors.black,
          ),
        ),
        dropdownButtonBuilder: (_) => const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.arrow_drop_down,
            size: 24,
            color: Colors.black,
          ),
        ),
        showSelectedItems: true,
        items: liste,
        showClearButton: true,
        onChanged: onchanged,
        selectedItem: secilenItem,
      ),
    );
  }

  static Future<void> showInitialDialog(
      {required BuildContext context,
      required Widget liste,
      required String isim}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          insetPadding: const EdgeInsets.all(3),
          elevation: 10,
          content: SizedBox(
            height: (MediaQuery.of(context).size.height / 3) * 2,
            width: (MediaQuery.of(context).size.height / 3) * 3,
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StatikTexts.yaziText(
                        text: isim,
                        yaziRengi: Renkler.ikonAktif,
                        weight: FontWeight.bold,
                        size: 24),
                    IconButton(
                        alignment: Alignment.bottomRight,
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.close,
                          size: 30,
                          color: Colors.red,
                        )),
                  ],
                ),
                liste
              ],
            ),
          ),
        );
      },
    );
  }
}
