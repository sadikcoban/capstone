import 'package:flutter/material.dart';
import 'package:park_desktop/HomPage/home_page_items.dart';
import 'package:park_desktop/HomPage/home_page_view_model.dart';
import 'package:park_desktop/StaticWidgets/renkler.dart';
import 'package:park_desktop/StaticWidgets/static_widget_class.dart';
import 'package:stacked/stacked.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
        viewModelBuilder: () => HomePageViewModel(),
        builder: (context, model, child) => SafeArea(
                child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  HomePageItems().avatarCard(),
                  const SizedBox(
                    height: 25,
                  ),
                  HomePageItems().getCampaigns(context),
                  const SizedBox(
                    height: 25,
                  ),
                  HomePageItems().getInfoList(),
                  const SizedBox(
                    height: 25,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () => model.navigateTo(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StaticWidgetClass.itemYazi(
                            context: context,
                            baslik: "Araçlar",
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                        Icon(
                          Icons.add,
                          color: Renkler.morRenk,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () => StaticWidgetClass.showInitialDialog(
                        context: context,
                        liste: HomePageItems().carGeneralInfo(
                            carBrand: "Renault",
                            context: context,
                            carModel: "Clio",
                            plateNumber: "39 SMA 0001",
                            color: "Beyaz",
                            year: "2018"),
                        isim: "Araç Bilgileri"),
                    child: HomePageItems().carIdentity(),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () => StaticWidgetClass.showInitialDialog(
                        context: context,
                        liste: HomePageItems().carGeneralInfo(
                            carBrand: "Renault",
                            context: context,
                            carModel: "Clio",
                            plateNumber: "39 SMA 0001",
                            color: "Beyaz",
                            year: "2018"),
                        isim: "Araç Bilgileri"),
                    child: HomePageItems().carIdentity(),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () => StaticWidgetClass.showInitialDialog(
                        context: context,
                        liste: HomePageItems().carGeneralInfo(
                            carBrand: "Renault",
                            context: context,
                            carModel: "Clio",
                            plateNumber: "39 SMA 0001",
                            color: "Beyaz",
                            year: "2018"),
                        isim: "Araç Bilgileri"),
                    child: HomePageItems().carIdentity(),
                  ),
                ],
              ),
            )));
  }
}
