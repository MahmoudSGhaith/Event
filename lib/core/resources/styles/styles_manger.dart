

import 'package:event/core/resources/colors/colors_manger.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class StylesManger {
  static TextStyle bold15Primary = GoogleFonts.inter(
      fontSize: 15,
      color: ColorsManger.primary,
      fontWeight: FontWeight.bold
  );
  static TextStyle bold18Primary = GoogleFonts.inter(
    fontSize: 18,
    color: ColorsManger.primary,
    fontWeight: FontWeight.bold
  );
  static TextStyle bold15black = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    color: ColorsManger.black,
    fontSize: 15
  );
  static TextStyle bold15white = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    color: ColorsManger.white,
    fontSize: 15
  );
  static TextStyle medium15grey = GoogleFonts.inter(
    color: ColorsManger.grey,
    fontSize: 15,
    fontWeight: FontWeight.w600
  );
  static TextStyle medium15white = GoogleFonts.inter(
    color: ColorsManger.white,
    fontSize: 15,
    fontWeight: FontWeight.w600
  );
  static TextStyle medium18Primary = GoogleFonts.inter(
    fontSize: 18 ,
    fontWeight: FontWeight.w600,
    color: ColorsManger.primary
  );
  static TextStyle medium18white = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    fontSize: 18,
    color: ColorsManger.light
  );
  static TextStyle bold18white = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: ColorsManger.light
  );
  static TextStyle medium18black = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    fontSize: 18,
    color: ColorsManger.black
  );
  static TextStyle boldItalic15primary = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    fontSize: 15,
    color: ColorsManger.primary,
    fontStyle: FontStyle.italic,
    decoration: TextDecoration.underline,
  );

}