import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:park_desktop/StaticWidgets/renkler.dart';

class IntroSlideClass {
  Slide addSlide(
      String title, String description, String image, BuildContext context) {
    Slide slide = Slide(
      title: title,
      maxLineTitle: 2,
      styleTitle: GoogleFonts.montserrat(
        color: Colors.white,
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
      ),
      description: description,
      styleDescription: GoogleFonts.montserrat(
        color: Colors.white70,
        fontSize: 17.0,
        fontStyle: FontStyle.italic,
      ),
      marginDescription: const EdgeInsets.only(
          left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
      colorBegin: Renkler.morRenk,
      colorEnd: Renkler.morKapali,
      pathImage: 'images/$image.png',
      directionColorBegin: Alignment.topLeft,
      directionColorEnd: Alignment.bottomRight,
      onCenterItemPress: () {},
    );
    return slide;
  }
}
