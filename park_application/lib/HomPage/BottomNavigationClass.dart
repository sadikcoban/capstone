import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:park_application/HomPage/HomePage.dart';
import 'package:park_application/StaticFolder/AnimationTransition.dart';

class BottomNavigationClass extends StatefulWidget {
  @override
  _BottomNavigationClassState createState() => _BottomNavigationClassState();
}

class _BottomNavigationClassState extends State<BottomNavigationClass> {
  int currentIndex=0;
  final tabs = [HomePage(), HomePage(), HomePage(), HomePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: AnimationTranstion.mainColor,
      body: tabs[currentIndex],
      bottomNavigationBar: DotNavigationBar(
        currentIndex: currentIndex,
        onTap: _handleIndexChanged,
        // dotIndicatorColor: Colors.black,
        items: [
          /// Home
          DotNavigationBarItem(
            icon: Icon(Icons.home),
            selectedColor:  Color(0xff3E64FF),
          ),

          /// Likes
          DotNavigationBarItem(
            icon: Icon(Icons.map),
            selectedColor: Colors.pink,
          ),

          /// Search
          DotNavigationBarItem(
            icon: Icon(Icons.favorite),
            selectedColor: Colors.orange,
          ),

          /// Profile
          DotNavigationBarItem(
            icon: Icon(Icons.person),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }

  void _handleIndexChanged(int i) {
    setState(() {
      currentIndex = i;
    });
  }
}
