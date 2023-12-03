
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nmg_assignment/styles/colors.dart';

class MyTestStyles{
  static var titleTextStyle = GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize:16,
                  height: 1.2,
                  letterSpacing: .2,
                  color:MyColors.blackColor,
                );
                static var subTitleTextStyle = GoogleFonts.raleway(
                  fontWeight: FontWeight.w500,
                  fontSize:14,
                  height: 1.2,
                  letterSpacing: .2,
                  color:MyColors.blackColor,
                );
                 static var normalTextStyle = GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize:12,
                  height: 1.2,
                  letterSpacing: .2,
                  color:MyColors.blackColor,
                );
}