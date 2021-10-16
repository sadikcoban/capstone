import 'package:flutter/material.dart';
import 'package:park_mobil/UI/StaticWidgets/renkler.dart';
import 'package:park_mobil/UI/StaticWidgets/statik_texts.dart';

class Avatar extends StatelessWidget {
  final String shortName;

  const Avatar({Key? key, required this.shortName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget child =StatikTexts.yaziText(text: shortName, yaziRengi: Colors.white);
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
