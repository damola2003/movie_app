import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const apiKey = '98f86b0449db62b78f411cc68aae2b96';
  static const baseUrl = 'https://api.themoviedb.org/3/';
  static const imagePath = 'https://image.tmdb.org/t/p/w500/';
  static final headlineStyle = GoogleFonts.aBeeZee(
      textStyle: TextStyle(
          color: Colors.grey[200], fontSize: 23, fontWeight: FontWeight.bold));
  static final movieText = GoogleFonts.aBeeZee(
    textStyle: TextStyle(
        color: Colors.grey[200], fontSize: 19, fontWeight: FontWeight.w600),
  );
  static final overviewText = GoogleFonts.aBeeZee(
    textStyle: TextStyle(
        color: Colors.grey[200], fontSize: 16, fontWeight: FontWeight.w600),
  );
}
