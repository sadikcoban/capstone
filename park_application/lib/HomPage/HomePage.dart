import 'package:flutter/material.dart';
import 'package:park_application/HomPage/HomePageItems.dart';
import 'package:park_application/StaticFolder/AnimationTransition.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
      child: Column(
        children: [
          SizedBox(height: 25,),
          HomePageItems().avatarCard(),
          SizedBox(
            height: 25,
          ),
          HomePageItems().getCampaigns(context),
          SizedBox(
            height: 25,
          ),
          HomePageItems().getInfoList(),
          SizedBox(height: 25,),
          HomePageItems().carIdentity(),
        ],
      ),
    ));
  }
}
