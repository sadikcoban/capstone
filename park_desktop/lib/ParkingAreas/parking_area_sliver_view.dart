import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:park_desktop/ParkingAreas/parking_area_sliver_view_model.dart';
import 'package:park_desktop/StaticWidgets/renkler.dart';
import 'package:park_desktop/StaticWidgets/static_widget_class.dart';
import 'package:park_desktop/libFolder/card_sliver_bar.dart';
import 'package:park_desktop/temp_list.dart';
import 'package:stacked/stacked.dart';

class ParkingAreaSliverView extends StatelessWidget {
  const ParkingAreaSliverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ParkingAreaSlivewModel>.reactive(
        viewModelBuilder: () => ParkingAreaSlivewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: Renkler.backgroundColor,
              body: CardSliverAppBar(
                  backButton: true,
                  height: 300,
                  background: Image.asset("images/kayseriForum1.jpg"),
                  title: StaticWidgetClass.itemYazi(
                      context: context,
                      baslik: "Kayseri Forum Otoparkı",
                      fontWeight: FontWeight.bold,
                      color: Renkler.morKapali),
                  card: const AssetImage("images/kayseriForum2.jpg"),
                  body: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width / 20),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 40,
                              ),
                              StaticWidgetClass.itemYazi(
                                  context: context,
                                  baslik: TempList().kayseriForumAbput,
                                  textAlign: TextAlign.left),
                              const SizedBox(
                                height: 25,
                              ),
                              GestureDetector(
                                onTap: () => model.datePicker(context: context),
                                child: StaticWidgetClass.ikonVeYazi(
                                    context: context,
                                    icon: Icon(
                                      Icons.date_range,
                                      color: Renkler.morKapali,
                                    ),
                                    alignment: MainAxisAlignment.start,
                                    baslik: model.date,
                                    color: Colors.black,
                                    fontSize: 20),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              StaticWidgetClass.itemYazi(
                                  context: context,
                                  baslik: "Saat Seçimi",
                                  fontWeight: FontWeight.w600,
                                  color: Renkler.ikonAktif,
                                  fontSize: 25),
                              const SizedBox(
                                height: 25,
                              ),
                              Wrap(children: <Widget>[
                                for (var i = 0; i < model.hourList.length; i++)
                                  GestureDetector(
                                    onTap: () => model.setActiveHour(
                                      index: i,
                                      list: model.hourList,
                                    ),
                                    child: StaticWidgetClass.butonWithBorder(
                                        context: context,
                                        text: model.hourList[i].hour,
                                        textColor: model.getTextColor(
                                            index: i, list: model.hourList),
                                        butonColor: model.getButtonBodyColor(
                                            index: i, list: model.hourList),
                                        butonBorderColor:
                                            model.getButtonBorderColor(
                                                index: i, list: model.hourList),
                                        width: 70,
                                        height: 40),
                                  )
                              ]),
                              const SizedBox(
                                height: 30,
                              ),
                              StaticWidgetClass.itemYazi(
                                  context: context,
                                  baslik: "Toplam Durulacak Saat",
                                  fontWeight: FontWeight.w600,
                                  color: Renkler.ikonAktif,
                                  fontSize: 25),
                              const SizedBox(
                                height: 25,
                              ),
                              Wrap(children: <Widget>[
                                for (var i = 0;
                                    i < model.totalHourList.length;
                                    i++)
                                  GestureDetector(
                                    onTap: () => model.setActiveHour(
                                      index: i,
                                      list: model.totalHourList,
                                    ),
                                    child: StaticWidgetClass.butonWithBorder(
                                        context: context,
                                        text: model.totalHourList[i].hour,
                                        textColor: model.getTextColor(
                                            index: i,
                                            list: model.totalHourList),
                                        butonColor: model.getButtonBodyColor(
                                            index: i,
                                            list: model.totalHourList),
                                        butonBorderColor:
                                            model.getButtonBorderColor(
                                                index: i,
                                                list: model.totalHourList),
                                        width: 70,
                                        height: 40),
                                  )
                              ]),
                              const SizedBox(
                                height: 30,
                              ),
                              StaticWidgetClass.itemYazi(
                                  context: context,
                                  baslik: "Kat Seçimi",
                                  fontWeight: FontWeight.w600,
                                  color: Renkler.ikonAktif,
                                  fontSize: 25),
                              const SizedBox(
                                height: 25,
                              ),
                              Wrap(children: <Widget>[
                                for (var i = 0; i < model.floorList.length; i++)
                                  GestureDetector(
                                    onTap: () => model.setActiveHour(
                                      index: i,
                                      list: model.floorList,
                                    ),
                                    child: StaticWidgetClass.butonWithBorder(
                                        context: context,
                                        text: model.floorList[i].hour,
                                        textColor: model.getTextColor(
                                            index: i, list: model.floorList),
                                        butonColor: model.getButtonBodyColor(
                                            index: i, list: model.floorList),
                                        butonBorderColor:
                                            model.getButtonBorderColor(
                                                index: i,
                                                list: model.floorList),
                                        width: 70,
                                        height: 40),
                                  )
                              ]),
                              const SizedBox(
                                height: 30,
                              ),
                              DottedBorder(
                                dashPattern: const [2, 4],
                                strokeWidth: 2,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    rectBorderWidget(
                                        model: model,
                                        startPoint: 0,
                                        endPoint:
                                            (model.parkingLotList.length / 2)
                                                .round(),
                                        context: context),
                                    rectBorderWidget(
                                        model: model,
                                        startPoint:
                                            (model.parkingLotList.length / 2)
                                                .round(),
                                        endPoint: model.parkingLotList.length,
                                        context: context),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              parkEntry(context: context),
                              const SizedBox(
                                height: 30,
                              ),
                              StaticWidgetClass.butonTasarimi(
                                  context: context,
                                  baslik: "ONAYLA",
                                  color: Renkler.morRenk)
                            ]),
                      ))),
            ));
  }

  /// Draw a border with rectangular border
  Widget rectBorderWidget(
      {required ParkingAreaSlivewModel model,
      required int startPoint,
      required int endPoint,
      required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: SizedBox(
        child: Column(
          children: <Widget>[
            for (var i = startPoint; i < endPoint; i++)
              parkLotModel(model: model, index: i, context: context),
          ],
        ),
      ),
    );
  }

  parkEntry({required BuildContext context}) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("images/park_entry_car.png"),
          const SizedBox(
            height: 5,
          ),
          Icon(
            Icons.arrow_upward,
            color: Renkler.morRenk,
          ),
          const SizedBox(
            height: 5,
          ),
          StaticWidgetClass.itemYazi(
              context: context,
              baslik: "GİRİŞ",
              color: Renkler.morKapali,
              fontWeight: FontWeight.w600),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  parkLotModel(
      {required ParkingAreaSlivewModel model,
      required int index,
      required BuildContext context}) {
    bool isFilled = model.parkingLotList[index].isFilled;
    String? image = model.parkingLotList[index].carType;
    String lotName = model.parkingLotList[index].parkingLotName;
    return GestureDetector(
      onTap: () => model.setParkingLot(index: index),
      child: Container(
        height: 70,
        width: 120,
        color: model.getParkinLotBodyColor(index: index),
        child: Center(
          child: isFilled
              ? Image.asset(
                  "images/park_${image}_model.png",
                  height: 80,
                  width: 80,
                  fit: BoxFit.contain,
                )
              : StaticWidgetClass.itemYazi(
                  context: context,
                  baslik: lotName,
                  color: model.getParkingLotTextColor(index: index),
                  fontWeight: FontWeight.w500,
                  fontSize: 19),
        ),
      ),
    );
  }
}
