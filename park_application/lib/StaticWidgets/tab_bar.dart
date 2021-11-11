import 'package:flutter/material.dart';
import 'package:park_mobil/UI/StaticWidgets/renkler.dart';
import 'package:park_mobil/UI/StaticWidgets/statik_texts.dart';

class Tabbar extends StatelessWidget {
  final List<String> basliklar;
  final List<Widget> merkezler;

  const Tabbar({Key? key, required this.basliklar, required this.merkezler})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Renkler.arkaPlanRengi,
      ),
      child: DefaultTabController(
        length: basliklar.length,
        child: Scaffold(
          backgroundColor: Renkler.arkaPlanRengi,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(35.0),
            child: TabBar(
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 15),
              isScrollable: true,
              indicatorColor: Colors.black,
              unselectedLabelColor: Colors.black,
              labelColor: Colors.black,
              tabs: basliklar.map((String item) {
                return StatikTexts.yaziText(text: item, size: 20);
              }).toList() as List<Widget>,
            ),
          ),
          body: TabBarView(
            children: merkezler.map((Widget widget) {
              return widget;
            }).toList(),
          ),
        ),
      ),
    );
  }
}
