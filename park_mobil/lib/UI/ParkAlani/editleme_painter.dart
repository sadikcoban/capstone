import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:park_mobil/UI/ParkAlani/editleme_view_model.dart';
import 'package:park_mobil/UI/ParkAlani/line_item.dart';

class EditlemePainter extends CustomPainter {
  List<LineItems> offsets = [];
  final EditlemeViewModel provider;
  List<ShapeItems> shapeItem = [];
  EditlemePainter(this.offsets, this.provider, this.shapeItem) : super();

  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    final paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 2.0;
    log("inside paint: line length: ${offsets.length} shape length:${shapeItem.length}");

    log("aa");
    for (var i = 0; i < shapeItem.length; i++) {
      log("$i shaoede");
      // paint.color = offsets[i].color;
      paint.color = Colors.blue;
      canvas.drawPath(
          Path()
            ..addPolygon([
              shapeItem[i].lineItems[0].start,
              shapeItem[i].lineItems[1].start,
              shapeItem[i].lineItems[2].start,
              shapeItem[i].lineItems[3].start,
            ], true),
          paint);
    }

    log("bb");
    for (var i = 0; i < offsets.length; i++) {
      log("$i lşnede");
      paint.color = Colors.red;
      if (i > 0) {
        canvas.drawLine(offsets[i - 1].start, offsets[i].start, paint);
      }
      if (i == 3) {
        canvas.drawLine(offsets[0].start, offsets[3].start, paint);
        shapeItem.add(ShapeItems(
          lineItems: offsets,
        ));
        offsets = <LineItems>[];
      }

      canvas.drawCircle(offsets[i].start, 10, paint);
      canvas.drawCircle(offsets[i].end, 10, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
