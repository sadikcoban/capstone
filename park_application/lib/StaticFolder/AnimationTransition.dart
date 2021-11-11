import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

class AnimationTranstion {
  static Color mainColor = Color(0xffF7F7FA);
  // Soldan Sağa Geçen Animasyondur.
  static AnimationPushWidget_LeftToRight(
      Widget CurrentPage, BuildContext context) {
    Navigator.push(context,
        PageTransition(type: PageTransitionType.leftToRight, child: CurrentPage));
  }

  // Sağdan Sola Geçen Animasyondur.
  static AnimationPushWidget_RightToLeft(
      Widget CurrentPage, BuildContext context) {
    Navigator.push(context,
        PageTransition(type: PageTransitionType.rightToLeft, child: CurrentPage));
  }
  static Avatar(
      String adress, Color color, BoxFit fit, double height, double width) {
    final String assetName = "images/" + adress + ".svg";
    final Widget svg = SvgPicture.asset(
      assetName,
      color: color,
      fit: fit,
    );
    return new Container(
      height: height,
      width: width,
      child: svg,
    );
  }
  static AvatarWithoutColor(
      String adress, BoxFit fit, double height, double width) {
    final String assetName = "images/" + adress + ".svg";
    final Widget svg = SvgPicture.asset(
      assetName,
      fit: fit,
    );
    return new Container(
      height: height,
      width: width,
      child: svg,
    );
  }
}