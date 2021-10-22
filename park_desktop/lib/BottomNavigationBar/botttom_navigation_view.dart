import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:park_desktop/BottomNavigationBar/bottom_navigation_bar_view_model.dart';
import 'package:park_desktop/StaticWidgets/renkler.dart';
import 'package:stacked/stacked.dart';

class BottomNavigatonView extends StatelessWidget {
  const BottomNavigatonView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomNavigationViewModel>.reactive(
        viewModelBuilder: () => BottomNavigationViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: Renkler.backgroundColor,
              body: model.tabs[model.currentIndex],
              bottomNavigationBar: DotNavigationBar(
                enableFloatingNavBar: true,
                currentIndex: model.currentIndex,
                onTap: model.handleIndexChanged,
                // dotIndicatorColor: Colors.black,
                items: [
                  /// Home
                  DotNavigationBarItem(
                    icon: const Icon(Icons.home),
                    selectedColor: const Color(0xff3E64FF),
                  ),

                  /// Likes
                  DotNavigationBarItem(
                    icon: const Icon(Icons.map),
                    selectedColor: Colors.pink,
                  ),

                  /// Search
                  DotNavigationBarItem(
                    icon: const Icon(Icons.favorite),
                    selectedColor: Colors.orange,
                  ),

                  /// Profile
                  DotNavigationBarItem(
                    icon: const Icon(Icons.person),
                    selectedColor: Colors.teal,
                  ),
                ],
              ),
            ));
  }
}
