import 'package:flutter/material.dart';
import 'package:park_desktop/Favorites/rezervation_view_model.dart';
import 'package:park_desktop/StaticWidgets/renkler.dart';
import 'package:park_desktop/StaticWidgets/static_widget_class.dart';
import 'package:park_desktop/StaticWidgets/tab_bar.dart';
import 'package:stacked/stacked.dart';

class RezervationView extends StatelessWidget {
  const RezervationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RezervationViewModel>.reactive(
        viewModelBuilder: () => RezervationViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: Renkler.backgroundColor,
              body: SafeArea(
                child: Padding(
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.width / 20),
                    child: Tabbar(basliklar: const [
                      "Rezervasyonlarım",
                      "Geçmiş Rezervasyonlarım"
                    ], merkezler: [
                      myRezervation(context: context, model: model),
                      pastRezervation(context: context, model: model)
                    ])),
              ),
            ));
  }

  Widget myRezervation(
      {required BuildContext context, required RezervationViewModel model}) {
    return ListView(
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 50,
          ),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => RezervationItem(
                    isWaiting: true,
                    isPassed: true,
                    model: model,
                  ),
              separatorBuilder: (context, index) => const Divider(
                    thickness: 3,
                    height: 2,
                  ),
              itemCount: 10)
        ]),
      ],
    );
  }

  Widget pastRezervation(
      {required BuildContext context, required RezervationViewModel model}) {
    return ListView(
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 50,
          ),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => RezervationItem(
                    isWaiting: false,
                    isPassed: index % 2 == 0 ? true : false,
                    model: model,
                  ),
              separatorBuilder: (context, index) => const Divider(
                    thickness: 3,
                    height: 2,
                  ),
              itemCount: 10)
        ]),
      ],
    );
  }
}

class RezervationItem extends StatelessWidget {
  final bool isWaiting;
  final bool isPassed;
  final RezervationViewModel model;
  const RezervationItem(
      {Key? key,
      required this.isWaiting,
      required this.isPassed,
      required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => model.navgateTo(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: ListTile(
          title: StaticWidgetClass.itemYazi(
              context: context,
              baslik: "Kayseri Forum Otopark 5. Kat A7\n",
              textAlign: TextAlign.left,
              fontSize: 16,
              fontWeight: FontWeight.w700),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StaticWidgetClass.itemYazi(
                  context: context,
                  baslik: "17 Kasım 2021 12.30 - 13.30\n",
                  textAlign: TextAlign.left,
                  color: Renkler.textPasif),
              StaticWidgetClass.itemYazi(
                  context: context,
                  baslik: "39 SMA 0001\n",
                  textAlign: TextAlign.left,
                  color: Renkler.textPasif),
              StaticWidgetClass.itemYazi(
                  context: context,
                  baslik: "Araç Park Alanında",
                  textAlign: TextAlign.left,
                  color: StaticWidgetClass.yesilRenk),
            ],
          ),
          trailing: StaticWidgetClass.itemYazi(
              context: context,
              baslik: "25.57 ₺",
              fontWeight: FontWeight.w700,
              color: isWaiting
                  ? Renkler.ikonAktif
                  : isPassed
                      ? Renkler.parkAlanihazirDisRenk
                      : Renkler.kirmiziRenk),
        ),
      ),
    );
  }

  iconContainer() {
    return Container(
      alignment: Alignment.center,
      width: 65.0,
      height: 65.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.0),
        color: Colors.white,
      ),
      child: Image.asset(
        "images/car.png",
        height: 30,
        width: 30,
      ),
    );
  }
}
