import 'package:flutter/material.dart';
import 'package:park_desktop/HomPage/home_page_items.dart';
import 'package:park_desktop/HomPage/home_page_view_model.dart';
import 'package:stacked/stacked.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(viewModelBuilder: ()=>HomePageViewModel(), builder: (context,model,child)=>  SafeArea(
        child: Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
      child: Column(
        children: [
          const SizedBox(height: 25,),
          HomePageItems().avatarCard(),
          const SizedBox(
            height: 25,
          ),
          HomePageItems().getCampaigns(context),
          const SizedBox(
            height: 25,
          ),
          HomePageItems().getInfoList(),
          const SizedBox(height: 25,),
          HomePageItems().carIdentity(),
        ],
      ),
    )));
  }
}