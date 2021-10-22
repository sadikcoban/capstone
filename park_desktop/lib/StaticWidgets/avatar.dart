import 'package:flutter/material.dart';
import 'package:park_desktop/StaticWidgets/renkler.dart';
import 'package:park_desktop/StaticWidgets/static_widget_class.dart';

class Avatar extends StatelessWidget {
  final String shortName;

  const Avatar({Key? key, required this.shortName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget child =StaticWidgetClass.itemYazi(baslik: shortName, color: Colors.white,context: context);
    return  Padding(
      padding: const EdgeInsets.all(10),
      child: CircleAvatar(
        radius: 14.0,
        child: FittedBox(
            fit: BoxFit.contain,
            child:child),
        backgroundColor: Renkler.turuncu,
      ),
    );
  }
}
