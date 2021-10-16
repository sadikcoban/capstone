import 'package:flutter/material.dart';

class LineItems {
  Offset start;
  Offset end;
  bool connected = false;
  Color color;
  double uzunluk = 1;
  LineItems({
    required this.start,
    required this.end,
    required this.color,
  });

  @override
  String toString() {
    return ('start: ' +
        start.toString() +
        ' end: ' +
        end.toString() +
        ' uzunluk: ' +
        uzunluk.toString());
  }
}


class ShapeItems {
  List<LineItems> lineItems;
  double xPos = 0;
  double yPos = 0;
  double area = 1;

  ShapeItems({required this.lineItems, required this.xPos, required this.yPos, required this.area});
}