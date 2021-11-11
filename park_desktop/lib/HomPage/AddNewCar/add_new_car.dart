import 'package:flutter/material.dart';
import 'package:park_desktop/HomPage/AddNewCar/add_new_car_view_model.dart';
import 'package:park_desktop/StaticWidgets/drop_down_string.dart';
import 'package:park_desktop/StaticWidgets/padding_static_class.dart';
import 'package:park_desktop/StaticWidgets/renkler.dart';
import 'package:park_desktop/StaticWidgets/static_widget_class.dart';
import 'package:stacked/stacked.dart';
import 'package:park_desktop/ApplicationBar/application_bar_view.dart';

class AddNewCar extends StatelessWidget {
  const AddNewCar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddNewCarViewModel>.reactive(
      viewModelBuilder: () => AddNewCarViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: const ApplicationBarView(
          baslik: "Araç Ekle",
        ),
        backgroundColor: Renkler.backgroundColor,
        body: Padding(
          padding: EdgeInsets.all(PaddingStaticClass().allPaddingRate(context)),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownString(
                      labelText: "Araç Markası",
                      liste: model.brandList,
                      secilenItem: model.carBrand,
                      onchanged: model.setCarBrand),
                  DropdownString(
                      labelText: "Araç Modeli",
                      liste: model.modelList,
                      secilenItem: model.carModel,
                      onchanged: model.setCarBrand),
                  DropdownString(
                      labelText: "Araç Rengi",
                      liste: model.colorList,
                      secilenItem: model.carColor,
                      onchanged: model.setcarColor),
                  DropdownString(
                      labelText: "Araç Yılı",
                      liste: model.yearList,
                      secilenItem: model.carYear,
                      onchanged: model.setCarYear),
                  const SizedBox(
                    height: 25,
                  ),
                  StaticWidgetClass.itemYazi(
                      context: context,
                      baslik: "Plaka Numarası",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.left),
                  const SizedBox(
                    height: 15,
                  ),
                  DropdownString(
                      labelText: "Şehir Kodu",
                      liste: model.cityCodeList,
                      secilenItem: model.cityCode,
                      onchanged: model.setCityCode),
                  StaticWidgetClass.loginTextField(
                      context: context,
                      controller: model.plateController,
                      hint: "Orta Kod"),
                  StaticWidgetClass.loginTextField(
                      context: context,
                      controller: model.plateController,
                      hint: "Son kod"),
                  Center(
                    child: Image.asset(
                      model.isFilled ? model.carImage : model.defaultImage,
                      height: model.isFilled ? 400 : 250,
                      width: model.isFilled ? 400 : 250,
                      alignment: Alignment.center,
                    ),
                  ),
                  StaticWidgetClass.butonTasarimi(
                      context: context,
                      baslik: "ONAYLA",
                      color: Renkler.parkAlanihazirDisRenk)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
