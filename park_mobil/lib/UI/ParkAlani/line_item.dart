import 'package:flutter/material.dart';

class LineItems {
  Offset start;
  Offset end;
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

  ShapeItems({required this.lineItems,});
}