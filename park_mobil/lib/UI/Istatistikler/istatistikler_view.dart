import 'dart:math';

import 'package:flutter/material.dart';
import 'package:park_mobil/UI/ApplicationBar/application_bar_view.dart';
import 'package:park_mobil/UI/Istatistikler/istatistikler_static.dart';
import 'package:park_mobil/UI/Istatistikler/istatitstikler_view_model.dart';
import 'package:park_mobil/UI/StaticWidgets/padding_static_class.dart';
import 'package:park_mobil/UI/StaticWidgets/renkler.dart';
import 'package:park_mobil/UI/StaticWidgets/statik_texts.dart';
import 'package:stacked/stacked.dart';

class IstatistiklerView extends StatelessWidget {
  const IstatistiklerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<IstatistiklerViewModel>.reactive(
        viewModelBuilder: () => IstatistiklerViewModel(),
        builder: (context, model, child) => Scaffold(
              appBar: const AppliactionBarView(),
              body: ListView(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: genelBakis(context: context),
                        flex: 1,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 20,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                  childAspectRatio: (2 / 1),
                                ),
                                itemBuilder: (
                                  context,
                                  index,
                                ) =>
                                    parkAlanlari(
                                        context: context,
                                        baslik:
                                            "Abdullah Gül Üniversite Park Alanı"))
                          ],
                        ),
                        flex: 1,
                      ),
                    ],
                  )
                ],
              ),
            ));
  }

  genelBakis({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.all(PaddingStaticClass.paddingRate * 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StatikTexts.yaziText(
              text: "GENEL BAKIŞ",
              yaziRengi: Renkler.ikonAktif,
              weight: FontWeight.bold,
              size: 24),
          hizliBakis(context),
          IstatistiklerStatic.buildTypesSplineChart(),
          IstatistiklerStatic.buildDefaultPieChart(),
          IstatistiklerStatic.buildDefaultRadialBarChart()
        ],
      ),
    );
  }

  hizliBakis(BuildContext context) {
    return Wrap(
      children: [
        StatikTexts.hizliBakis(
            baslik: "Boş Park Yeri ",
            aciklama: "15",
            context: context,
            yukesliyorMu: false,
            noktaRengi: Colors.green),
        StatikTexts.hizliBakis(
            baslik: "Anlık Araç Sayısı ",
            aciklama: "30",
            context: context,
            yukesliyorMu: true,
            noktaRengi: Colors.blue),
        StatikTexts.hizliBakis(
            baslik: "Günlük Araç Sayısı ",
            aciklama: "1,500",
            context: context,
            yukesliyorMu: true,
            noktaRengi: Colors.red),
        StatikTexts.hizliBakis(
            baslik: "Müşteri Memnuniyeti",
            aciklama: "4.2/5",
            context: context,
            yukesliyorMu: true,
            noktaRengi: Colors.deepPurple),
        StatikTexts.hizliBakis(
            baslik: "Günlük kazanç ",
            aciklama: "480 TL",
            context: context,
            yukesliyorMu: false,
            noktaRengi: Colors.indigoAccent),
      ],
    );
  }

  parkAlanlari({required BuildContext context, required String baslik}) {
    Color color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    return Padding(
      padding: const EdgeInsets.all(PaddingStaticClass.paddingRate * 5),
      child: GestureDetector(
        onTap: () => StatikTexts.showInitialDialog(
            context: context,
            liste: Column(
              children: [
                hizliBakis(context),
                IstatistiklerStatic.buildTypesSplineChart(),
                IstatistiklerStatic.buildDefaultPieChart(),
                IstatistiklerStatic.buildDefaultRadialBarChart()
              ],
            ),
            isim: baslik),
        child: Align(
          child: Container(
            height: 400,
            width: 300,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: color,
            ),
            child: Column(
              children: [
                Image.asset(
                  "assets/garage.png",
                  height: 100,
                  width: 100,
                ),
                StatikTexts.yaziText(
                    text: baslik,
                    weight: FontWeight.bold,
                    size: 20,
                    yaziRengi: Colors.white,
                    align: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
