import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:park_desktop/StaticWidgets/renkler.dart';
import 'package:stacked/stacked.dart';

class ParkingAreaSlivewModel extends BaseViewModel {
  List<HourAndFloorClass> hourList = [
    HourAndFloorClass(hour: "12.00", isChoosen: false, isFilled: true),
    HourAndFloorClass(hour: "12.30", isChoosen: false, isFilled: false),
    HourAndFloorClass(hour: "13.00", isChoosen: false, isFilled: true),
    HourAndFloorClass(hour: "13.30", isChoosen: false, isFilled: false),
    HourAndFloorClass(hour: "14.00", isChoosen: false, isFilled: true),
    HourAndFloorClass(hour: "14.30", isChoosen: false, isFilled: false),
    HourAndFloorClass(hour: "15.00", isChoosen: false, isFilled: true),
    HourAndFloorClass(hour: "15.30", isChoosen: false, isFilled: false),
    HourAndFloorClass(hour: "16.00", isChoosen: false, isFilled: true),
    HourAndFloorClass(hour: "16.30", isChoosen: false, isFilled: false),
    HourAndFloorClass(hour: "17.00", isChoosen: false, isFilled: true),
    HourAndFloorClass(hour: "17.30", isChoosen: false, isFilled: false),
    HourAndFloorClass(hour: "18.00", isChoosen: false, isFilled: true),
    HourAndFloorClass(hour: "18.30", isChoosen: false, isFilled: false),
    HourAndFloorClass(hour: "19.00", isChoosen: false, isFilled: true),
    HourAndFloorClass(hour: "19.30", isChoosen: false, isFilled: true),
    HourAndFloorClass(hour: "20.00", isChoosen: false, isFilled: false),
    HourAndFloorClass(hour: "20.30", isChoosen: false, isFilled: true),
  ];
  List<HourAndFloorClass> totalHourList = [
    HourAndFloorClass(hour: "1 saat", isChoosen: false, isFilled: true),
    HourAndFloorClass(hour: "2 saat", isChoosen: false, isFilled: false),
    HourAndFloorClass(hour: "3 saat", isChoosen: false, isFilled: true),
    HourAndFloorClass(hour: "4 saat", isChoosen: false, isFilled: false),
    HourAndFloorClass(hour: "5 saat", isChoosen: false, isFilled: true),
    HourAndFloorClass(hour: "6 saat", isChoosen: false, isFilled: false),
    HourAndFloorClass(hour: "7 saat", isChoosen: false, isFilled: true),
    HourAndFloorClass(hour: "8 saat", isChoosen: false, isFilled: false),
    HourAndFloorClass(hour: "9 saat", isChoosen: false, isFilled: true),
    HourAndFloorClass(hour: "10 saat", isChoosen: false, isFilled: false),
    HourAndFloorClass(hour: "11 saat", isChoosen: false, isFilled: true),
    HourAndFloorClass(hour: "12 saat", isChoosen: false, isFilled: false),
    HourAndFloorClass(hour: "13 saat", isChoosen: false, isFilled: true),
    HourAndFloorClass(hour: "14 saat", isChoosen: false, isFilled: false),
    HourAndFloorClass(hour: "15 saat", isChoosen: false, isFilled: true),
    HourAndFloorClass(hour: "16 saat", isChoosen: false, isFilled: true),
    HourAndFloorClass(hour: "17 saat", isChoosen: false, isFilled: false),
    HourAndFloorClass(hour: "18 saat", isChoosen: false, isFilled: true),
  ];
  List<HourAndFloorClass> floorList = [
    HourAndFloorClass(hour: "K-1", isChoosen: false, isFilled: true),
    HourAndFloorClass(hour: "K-2", isChoosen: false, isFilled: false),
    HourAndFloorClass(hour: "K-3", isChoosen: false, isFilled: true),
    HourAndFloorClass(hour: "K-4", isChoosen: false, isFilled: false),
    HourAndFloorClass(hour: "K-5", isChoosen: false, isFilled: true),
    HourAndFloorClass(hour: "K-6", isChoosen: false, isFilled: false),
    HourAndFloorClass(hour: "K-7", isChoosen: false, isFilled: true),
  ];
  List<ParkingLotClass> parkingLotList = [
    ParkingLotClass(
        parkingLotName: "K1-A1",
        isFilled: true,
        isChose: false,
        carType: "truck"),
    ParkingLotClass(parkingLotName: "K1-A2", isFilled: false, isChose: false),
    ParkingLotClass(parkingLotName: "K1-A3", isFilled: false, isChose: false),
    ParkingLotClass(parkingLotName: "K1-A4", isFilled: false, isChose: false),
    ParkingLotClass(
        parkingLotName: "K1-A5",
        isFilled: true,
        isChose: false,
        carType: "car"),
    ParkingLotClass(
        parkingLotName: "K1-A6",
        isFilled: true,
        isChose: false,
        carType: "motorCycle"),
    ParkingLotClass(
        parkingLotName: "K1-A7",
        isFilled: true,
        isChose: false,
        carType: "car"),
    ParkingLotClass(
        parkingLotName: "K1-A8",
        isFilled: true,
        isChose: false,
        carType: "car"),
    ParkingLotClass(parkingLotName: "K1-A9", isFilled: false, isChose: false),
    ParkingLotClass(parkingLotName: "K1-A10", isFilled: false, isChose: false),
  ];
  String date = "Lütfen Bir Tarih Seçiniz";
  Color activeHourColor = Renkler.morKapali;
  Color deactiveHourColor = Renkler.ikonPasif;
  datePicker({required BuildContext context}) async {
    DateTime? newDateTime = await showRoundedDatePicker(
      context: context,
      theme: ThemeData.dark(),
    );
    dateTimeToString(newDate: newDateTime!);
  }

  dateTimeToString({required DateTime newDate}) {
    date = DateFormat.yMMMEd("tr_TR").format(newDate);
    notifyListeners();
  }

  setActiveHour({
    required int index,
    required List<HourAndFloorClass> list,
  }) {
    if (!list[index].isFilled) {
      for (var i = 0; i < list.length; i++) {
        if (index == i) {
          list[index].isChoosen = true;
          notifyListeners();
        } else {
          list[i].isChoosen = false;
        }
      }
    }
    notifyListeners();
  }

  Color getTextColor(
      {required int index, required List<HourAndFloorClass> list}) {
    if (list[index].isFilled) {
      return deactiveHourColor;
    } else {
      if (list[index].isChoosen) {
        return Colors.white;
      } else {
        return activeHourColor;
      }
    }
  }

  Color getButtonBodyColor(
      {required int index, required List<HourAndFloorClass> list}) {
    if (list[index].isFilled || !list[index].isChoosen) {
      return Colors.white;
    } else {
      return activeHourColor;
    }
  }

  Color getButtonBorderColor(
      {required int index, required List<HourAndFloorClass> list}) {
    if (list[index].isFilled) {
      return deactiveHourColor;
    } else {
      return activeHourColor;
    }
  }

  setParkingLot({required int index}) {
    if (!parkingLotList[index].isFilled) {
      for (var i = 0; i < parkingLotList.length; i++) {
        if (index == i) {
          parkingLotList[index].isChose = true;
          notifyListeners();
        } else {
          parkingLotList[i].isChose = false;
        }
      }
    }
    notifyListeners();
  }

  Color getParkinLotBodyColor({required int index}) {
    if (!parkingLotList[index].isChose) {
      return Renkler.backgroundColor;
    } else {
      return Renkler.morKapali;
    }
  }

  Color getParkingLotTextColor({required int index}) {
    if (parkingLotList[index].isChose) {
      return Colors.white;
    } else {
      return const Color(0xff1360FF);
    }
  }
}

class HourAndFloorClass {
  String hour;
  bool isChoosen;
  bool isFilled;
  HourAndFloorClass(
      {required this.hour, required this.isChoosen, required this.isFilled});
}

class ParkingLotClass {
  String parkingLotName;
  bool isFilled;
  bool isChose;
  String? carType;
  ParkingLotClass(
      {required this.parkingLotName,
      required this.isFilled,
      required this.isChose,
      this.carType});
}

class CouponsClass {
  String couponName;
  String couponEplanation;
  double couponPrice;
  CouponsClass(
      {required this.couponName,
      required this.couponEplanation,
      required this.couponPrice});
}
