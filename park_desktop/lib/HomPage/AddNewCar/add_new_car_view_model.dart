import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class AddNewCarViewModel extends BaseViewModel {
  bool isFilled = false;
  String carBrand = "";
  String carModel = "";
  String carColor = "";
  String carYear = "";
  String defaultImage = "images/car.png";
  String carImage = "images/clio.png";
  String cityCode = "";
  TextEditingController plateController = TextEditingController();
  setCarBrand(String? value) {
    carBrand = value!;
    isFilledFunction();
  }

  setCarModel(String? value) {
    carModel = value!;
    isFilledFunction();
  }

  setcarColor(String? value) {
    carColor = value!;
    isFilledFunction();
  }

  setCarYear(String? value) {
    carYear = value!;
    isFilledFunction();
  }
  setCityCode(String? value) {
    cityCode = value!;
    isFilledFunction();
  }

  isFilledFunction() {
    if (carBrand != "" || carYear != "" || carModel != "" || carColor != "") {
      isFilled = true;
      notifyListeners();
    }
  }

  List<String> brandList = ["Renault", "Volkswagen", "Honda", "Toyota", "FIAT"];
  List<String> modelList = [
    "Clio",
    "Passat",
    "Civic",
    "Vtec",
    "Corolla",
    "Linea"
  ];
  List<String> colorList = ["Kırmızı", "Yeşil", "Beyaz", "Mavi", "Siyah"];
  List<String> yearList = ["2016", "2017", "2018", "2019", "2020", "2021"];
  List<String> cityCodeList = ["01", "02", "03", "04", "05", "06"];
}
