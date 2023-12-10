import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:umc_mobile/constant/color.dart';

ThemeData theme(BuildContext context) {
  return ThemeData(
    primaryColor: AppColors.biru1,
    scaffoldBackgroundColor: AppColors.abu,
    textTheme: GoogleFonts.latoTextTheme(
      Theme.of(context).textTheme,
    ),
  );
}
