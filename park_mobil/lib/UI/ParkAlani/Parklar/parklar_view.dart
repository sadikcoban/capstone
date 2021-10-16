import 'package:flutter/material.dart';
import 'package:park_mobil/UI/ApplicationBar/application_bar_view.dart';
import 'package:park_mobil/UI/ParkAlani/Parklar/parklar_view_model.dart';
import 'package:park_mobil/UI/StaticWidgets/padding_static_class.dart';
import 'package:park_mobil/UI/StaticWidgets/renkler.dart';
import 'package:park_mobil/UI/StaticWidgets/statik_texts.dart';
import 'package:stacked/stacked.dart';

class ParklarView extends StatelessWidget {

  const ParklarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ParklarViewModel>.reactive(
      onModelReady: (model) => model.onModalReady(),
      viewModelBuilder: () => ParklarViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: const AppliactionBarView(),
        body: ListView(
          controller: model.scrollController,
          children: [
            yeniProje(aciklamaYazisi: "Yeni Otopark Oluştur", model: model),
            Scrollbar(
              controller: model.scrollController,
              isAlwaysShown: true,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ParkItem(
                  index: index,
                ),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  yeniProje({required String aciklamaYazisi, required ParklarViewModel model}) {
    return GestureDetector(
      onTap: () => model.navigateTo(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: PaddingStaticClass.paddingRate * 15,
            vertical: PaddingStaticClass.paddingRate * 5),
        child: Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(Icons.create, color: Renkler.textAktif),
                const SizedBox(
                  width: 20,
                ),
                StatikTexts.yaziText(
                    text: aciklamaYazisi,
                    yaziRengi: Renkler.parkAlaniParkItemBaslik,
                    size: 22,
                    weight: FontWeight.bold),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ParkItem extends StatelessWidget {
  final int index;
  const ParkItem({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: PaddingStaticClass.paddingRate * 15,
          vertical: PaddingStaticClass.paddingRate * 5),
      child: Container(
        height: 200.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(27.0),
          color: Renkler.appBarRengi,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: PaddingStaticClass.paddingRate * 10,
              vertical: PaddingStaticClass.paddingRate * 5),
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: iconArkaPlan(image: index % 2 == 0 ? "" : "arac"),
                ),
                flex: 1,
              ),
              Expanded(
                flex: 8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        baslik(baslikYazisi: "Kayseri Merkez Otopark"),
                        aciSayisi(aciSayisiYazi: 20),
                      ],
                    ),
                    lokasyon(
                        aciklamaYazisi:
                            "Barbaros, Sümer Kampüsü, Erkilet Blv., 38080 Kocasinan/Kayseri"),
                    aciklama(aciklamaYazisi: TempYazilar.aciklamaYazisi)
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    index % 2 == 0 ? tamamlandi() : beklemede(),
                    editle()
                  ],
                ),
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  iconArkaPlan({required String image}) {
    return image == ""
        ? Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Renkler.textPasif.withOpacity(0.2),
              ),
              child: const Icon(
                Icons.car_rental_rounded,
                color: Renkler.appBarRengi,
                size: 60,
              ),
            ),
          )
        : Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: AssetImage("assets/$image.png"),
                      fit: BoxFit.cover)),
            ),
          );
  }

  baslik({required String baslikYazisi}) {
    return StatikTexts.yaziText(
        text: baslikYazisi,
        yaziRengi: Renkler.parkAlaniParkItemBaslik,
        size: 24);
  }

  lokasyon({required String aciklamaYazisi}) {
    return Row(
      children: [
        const Icon(Icons.location_on, color: Renkler.turuncu),
        const SizedBox(
          width: 20,
        ),
        StatikTexts.yaziText(
            text: aciklamaYazisi,
            yaziRengi: Renkler.parkAlaniParkItemBaslik,
            size: 18),
      ],
    );
  }

  aciklama({required String aciklamaYazisi}) {
    return StatikTexts.yaziText(
        text: aciklamaYazisi, yaziRengi: Colors.grey, size: 18);
  }

  aciSayisi({required int aciSayisiYazi}) {
    return StatikTexts.yaziText(
        text: "$aciSayisiYazi Fotoğraf",
        yaziRengi: Renkler.parkAlaniParkItemBaslik,
        size: 18);
  }

  tamamlandi() {
    return // Group: Group 8
        Align(
      alignment: Alignment.centerRight,
      child: Container(
        alignment: const Alignment(0.0, 0.03),
        width: 194.16,
        height: 52.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Renkler.parkAlanihazirIcRenk,
          border: Border.all(
            width: 1.0,
            color: Renkler.parkAlanihazirDisRenk,
          ),
        ),
        child: StatikTexts.yaziText(
            text: "Tamamlandı",
            yaziRengi: Renkler.appBarRengi,
            weight: FontWeight.w700),
      ),
    );
  }

  beklemede() {
    return // Group: Group 8
        Align(
      alignment: Alignment.centerRight,
      child: Container(
        alignment: const Alignment(0.0, 0.03),
        width: 194.16,
        height: 52.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Renkler.appBarRengi,
          border: Border.all(
            width: 1.0,
            color: Renkler.parkAlanibeklemedeDisRenk,
          ),
        ),
        child: StatikTexts.yaziText(
            text: "Beklemede",
            yaziRengi: Renkler.parkAlanibeklemedeDisRenk,
            weight: FontWeight.w700),
      ),
    );
  }

  editle() {
    return // Group: Group 8
        Align(
      alignment: Alignment.centerRight,
      child: Container(
        alignment: const Alignment(0.0, 0.03),
        width: 194.16,
        height: 52.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Renkler.parkAlanieditlemeIcRenk,
          border: Border.all(
            width: 1.0,
            color: Renkler.parkAlanieditlemeDisRenk,
          ),
        ),
        child: StatikTexts.yaziText(
            text: "Düzenle",
            yaziRengi: Renkler.appBarRengi,
            weight: FontWeight.w700),
      ),
    );
  }
}
