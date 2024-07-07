import 'package:do_daily/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_kit/responsive_kit.dart';

class CustomTextStyle {
  TextStyle bold40 = GoogleFonts.openSans().copyWith(
    color: ConstColors().secondary,
    fontSize: SizeConfig.getMyDynamicHeight(40),
    fontWeight: FontWeight.bold,
  );
  TextStyle bold20 = GoogleFonts.openSans().copyWith(
    color: ConstColors().secondary,
    fontSize: SizeConfig.getMyDynamicHeight(20),
    fontWeight: FontWeight.bold,
  );

  TextStyle bold18 = GoogleFonts.openSans().copyWith(
    color: ConstColors().secondary,
    fontSize: SizeConfig.getMyDynamicHeight(18),
    fontWeight: FontWeight.bold,
  );

  TextStyle bold16 = GoogleFonts.openSans().copyWith(
    color: ConstColors().secondary,
    fontSize: SizeConfig.getMyDynamicHeight(16),
    fontWeight: FontWeight.bold,
  );

  TextStyle body14 = GoogleFonts.openSans().copyWith(
    color: ConstColors().secondary,
    fontSize: SizeConfig.getMyDynamicHeight(14),
  );

  TextStyle body12 = GoogleFonts.openSans().copyWith(
    color: ConstColors().secondary,
    fontSize: SizeConfig.getMyDynamicHeight(12),
  );

  TextStyle body11 = GoogleFonts.openSans().copyWith(
    color: ConstColors().secondary,
    fontSize: SizeConfig.getMyDynamicHeight(11),
  );
}
