import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro_slider/slide_object.dart';
class IntroSlideClass {
 Slide addSlide(
      String title, String description, String image, BuildContext context) {
    Slide slide = Slide(
      title: "$title",
      maxLineTitle: 2,
      styleTitle: GoogleFonts.montserrat(
        color: Colors.white,
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
      ),
      description: "$description",
      styleDescription: GoogleFonts.montserrat(
        color: Colors.white70,
        fontSize: 17.0,
        fontStyle: FontStyle.italic,
      ),
      marginDescription:
          EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
      colorBegin: Color(0xFF3E64FF),
      colorEnd: Color(0xff0C38ED),
      pathImage: 'images/$image.png',
      directionColorBegin: Alignment.topLeft,
      directionColorEnd: Alignment.bottomRight,
      onCenterItemPress: () {},
    );
    return slide;
  }
}
