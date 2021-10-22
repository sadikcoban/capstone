import 'package:flutter/material.dart';
import 'package:park_mobil/UI/ApplicationBar/application_bar_view.dart';
import 'package:park_mobil/UI/ParkAlani/YeniOtopark/yeni_otopark_view_model.dart';
import 'package:park_mobil/UI/StaticWidgets/padding_static_class.dart';
import 'package:park_mobil/UI/StaticWidgets/renkler.dart';
import 'package:park_mobil/UI/StaticWidgets/static_widget_class.dart';
import 'package:park_mobil/UI/StaticWidgets/statik_texts.dart';
import 'package:stacked/stacked.dart';

class YeniOtopark extends StatelessWidget {
  const YeniOtopark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<YeniOtoparkViewModel>.reactive(
        viewModelBuilder: () => YeniOtoparkViewModel(),
        builder: (context, model, child) => Scaffold(
            appBar: const AppliactionBarView(),
            body: ListView(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: otoparkDetaylari(context: context, model: model),
                      flex: 1,
                    ),
                    Expanded(
                      child: adminDetaylari(context: context, model: model),
                      flex: 1,
                    ),
                    Expanded(
                      child: fotografler(context: context, model: model),
                      flex: 1,
                    )
                  ],
                ),
              ],
            )));
  }

  otoparkDetaylari(
      {required BuildContext context, required YeniOtoparkViewModel model}) {
    return Padding(
      padding: const EdgeInsets.all(PaddingStaticClass.paddingRate * 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StatikTexts.yaziText(
              text: "OTOPARK DETAYLARI",
              yaziRengi: Renkler.ikonAktif,
              weight: FontWeight.bold,
              size: 24),
          StaticWidgetClass.loginTextField(
            context: context,
            controller: model.adController,
            hint: "Otopark İsmi",
          ),
          StaticWidgetClass.loginTextField(
              context: context,
              controller: model.adController,
              hint: "Toplam Alan Sayısı"),
          StatikTexts.dropDownString(
              labelText: "Şehir Seç",
              liste: TempYazilar.sehirler,
              secilenItem: model.sehir,
              onchanged: model.onChangedSehir),
          StatikTexts.dropDownString(
              labelText: "İlçe Seç",
              liste: TempYazilar.ilceler,
              secilenItem: model.ilce,
              onchanged: model.onchangedIlce),
          StatikTexts.dropDownString(
              labelText: "Mahalle Seç",
              liste: TempYazilar.ilceler,
              secilenItem: model.mahalle,
              onchanged: model.onchangedMahalle),
          StaticWidgetClass.loginTextField(
            context: context,
            controller: model.adController,
            hint: "Açık Adres",
          ),
          locationSec(context: context),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  adminDetaylari(
      {required BuildContext context, required YeniOtoparkViewModel model}) {
    return Padding(
      padding: const EdgeInsets.all(PaddingStaticClass.paddingRate * 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StatikTexts.yaziText(
              text: "YÖNETİCİ DETAYLARI",
              yaziRengi: Renkler.ikonAktif,
              weight: FontWeight.bold,
              size: 24),
          StaticWidgetClass.loginTextField(
              context: context,
              controller: model.aciklamaController,
              hint: "Ad"),
          StaticWidgetClass.loginTextField(
              context: context,
              controller: model.aciklamaController,
              hint: "Soyad"),
          StaticWidgetClass.loginTextField(
              context: context,
              controller: model.aciklamaController,
              hint: "Saatlik Otopark Ücreti"),
          StaticWidgetClass.loginTextField(
              context: context,
              controller: model.aciklamaController,
              hint: "Iban Numarası"),
          StaticWidgetClass.loginTextField(
              context: context,
              controller: model.aciklamaController,
              hint: "Çalışma Saatleri"),
          StaticWidgetClass.butonTasarimi(
              context: context, baslik: "Kaydet", color: Renkler.textAktif),
        ],
      ),
    );
  }

  fotografler(
      {required BuildContext context, required YeniOtoparkViewModel model}) {
    return Padding(
      padding: const EdgeInsets.all(PaddingStaticClass.paddingRate * 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StatikTexts.yaziText(
                  text: "FOTOĞRAFLAR",
                  yaziRengi: Renkler.ikonAktif,
                  weight: FontWeight.bold,
                  size: 24),
              GestureDetector(
                onTap: () => model.navigateTo(),
                child: StaticWidgetClass.ikonVeYazi(
                    context: context,
                    icon: const Icon(Icons.add),
                    baslik: "Ekle",
                    fontSize: 24,
                    color: Renkler.textAktif),
              ),
            ],
          ),
          Column(
            children: TempYazilar.fotolar
                .map(
                  (item) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () => showInitialDialog(
                                context: context, image: item.gercekResim),
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                      image: AssetImage(item.gercekResim),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => showInitialDialog(
                              context: context, image: item.oynanmisResim),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                      image: AssetImage(item.oynanmisResim),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  locationSec({required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        StaticWidgetClass.ikonVeYazi(
            context: context,
            alignment: MainAxisAlignment.end,
            icon: const Icon(
              Icons.location_on,
              color: Renkler.turuncu,
            ),
            baslik: "(46.867,76.86)",
            fontSize: 20,
            color: Renkler.parkAlanibeklemedeDisRenk),
        StaticWidgetClass.butonTasarimi(
            context: context,
            baslik: "Haritada Göster",
            color: Renkler.textAktif),
      ],
    );
  }

  uucretDetaylari() {
    return Column(
      children: [
        StatikTexts.yaziText(
            text: "ÜCRET DETAYLARI",
            yaziRengi: Renkler.ikonAktif,
            weight: FontWeight.bold,
            size: 24),
      ],
    );
  }

  static Future<void> showInitialDialog(
      {required BuildContext context, required String image}) async {
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StatikTexts.yaziText(
                        text: "ASMA KAT A KÖŞESİ",
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
                const Spacer(
                  flex: 1,
                ),
                Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
