import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color colorFirst = const Color.fromRGBO(231, 246, 242, 1);
Color colorSecond = const Color.fromRGBO(165, 201, 202, 1);
Color colorThird = const Color.fromRGBO(57, 91, 100, 1);
Color colorFourth = const Color.fromRGBO(44, 51, 51, 1);

Color colorAccent = const Color.fromRGBO(92, 68, 152, 50);
Color colorAccentSecond = const Color.fromRGBO(96, 68, 52, 50);

Color colorTransparent = const Color.fromRGBO(57, 91, 100, 50);

Map<String, Color> colorMap = {
  "Events": Colors.yellow.withOpacity(.75),
  "Contacts": Colors.green.withOpacity(.75),
  "Service Projects": Colors.blue.withOpacity(.75)
};

TextStyle styleTitle = GoogleFonts.robotoCondensed(textStyle:  TextStyle(color: colorFirst, fontSize: 48, fontWeight: FontWeight.w300));
TextStyle styleSubtitle = GoogleFonts.cabin(textStyle:  TextStyle(color: colorFirst, fontSize: 28, fontWeight: FontWeight.w400));
TextStyle styleBody = GoogleFonts.cabin(textStyle:  TextStyle(color: colorFirst, fontSize: 18, fontWeight: FontWeight.w200));
