/*
 * Copyright 2020 Cagatay Ulusoy (Ulus Oy Apps). All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ulusoyapps_flutter/resources/themes/text/company_text_theme.dart';

class CompanyTextThemeC extends CompanyTextTheme {
  CompanyTextThemeC(Color displayColor, Color bodyColor) : super(displayColor, bodyColor);

  @override
  TextTheme buildPrimaryTextTheme(Color displayColor, Color bodyColor) => baseTextTheme.copyWith(
        button: baseTextTheme.caption.copyWith(
          fontWeight: FontWeight.w800,
          fontSize: 14,
          color: displayColor,
        ),
      );

  @override
  TextTheme buildSecondaryTextTheme(Color displayColor, Color bodyColor) => baseTextTheme.copyWith(
        button: baseTextTheme.caption.copyWith(
          fontWeight: FontWeight.w800,
          fontSize: 14,
          color: displayColor,
        ),
      );

  @override
  TextTheme buildBaseTextTheme(Color displayColor, Color bodyColor) {
    final currentTextTheme = TextTheme(
      headline1: GoogleFonts.sansita(fontSize: 97, fontWeight: FontWeight.w300, letterSpacing: -1.5),
      headline2: GoogleFonts.sansita(fontSize: 61, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      headline3: GoogleFonts.sansita(fontSize: 48, fontWeight: FontWeight.w400),
      headline4: GoogleFonts.sansita(fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      headline5: GoogleFonts.sansita(fontSize: 24, fontWeight: FontWeight.w400),
      headline6: GoogleFonts.sansita(fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
      subtitle1: GoogleFonts.sansita(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
      subtitle2: GoogleFonts.sansita(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      bodyText1: GoogleFonts.sansita(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
      bodyText2: GoogleFonts.sansita(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      button: GoogleFonts.sansita(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
      caption: GoogleFonts.sansita(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
      overline: GoogleFonts.sansita(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
    );
    return GoogleFonts.sansitaTextTheme(currentTextTheme);
  }
}
