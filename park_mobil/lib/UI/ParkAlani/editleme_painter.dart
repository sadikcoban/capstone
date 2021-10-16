import 'package:flutter/material.dart';
import 'package:park_mobil/UI/ParkAlani/editleme_view_model.dart';
import 'package:park_mobil/UI/ParkAlani/line_item.dart';

class EditlemePainter extends CustomPainter {
  final List<LineItems> offsets;
  final EditlemeViewModel provider;

  EditlemePainter(this.offsets, this.provider) : super();

  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    final paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 2.0;

    for (var i = 0; i < offsets.length; i++) {
      paint.color = offsets[i].color;
      TextSpan span =  TextSpan(
          style:  TextStyle(
              color: Colors.blue[800], fontSize: 20.0, fontFamily: 'Roboto'),
          text: "${offsets[i].uzunluk.toStringAsFixed(1)} m");
      TextPainter tp =  TextPainter(
        text: span,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
      );
      tp.layout();
      double textX = ((offsets[i].start.dx + offsets[i].end.dx) / 2) - 30;
      double textY = (offsets[i].start.dy + offsets[i].end.dy) / 2;
      if (provider.olcuAlindi) tp.paint(canvas,  Offset(textX, textY));
      if (provider.shapes.isNotEmpty) {
        for (var item in provider.shapes) {
          span =  TextSpan(
              style:  TextStyle(
                  color: Colors.blue[800],
                  fontSize: 20.0,
                  fontFamily: 'Roboto'),
              text: "${item.area.toStringAsFixed(2)} m");
          tp =  TextPainter(
            text: span,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
          );
          textX = item.xPos;
          textY = item.yPos;
          tp.layout();
          tp.paint(canvas,  Offset(textX, textY));
        }
      }
      canvas.drawLine(offsets[i].start, offsets[i].end, paint);
      canvas.drawCircle(offsets[i].start, 10, paint);
      canvas.drawCircle(offsets[i].end, 10, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}