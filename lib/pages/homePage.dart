import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:movie_app/utils/topRated.dart';
import 'package:movie_app/utils/trendingMovies.dart';
import 'package:movie_app/utils/upcomingMovies.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Center(
                child: Text("Cirama",
                    style: GoogleFonts.aBeeZee(
                      textStyle: const TextStyle(
                          color: Colors.red,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ),
            const SizedBox(height: 10),
            const TrendingMoviesPage(),
            const SizedBox(height: 10),
            const UpcomingMoviesPage(),
            const SizedBox(height: 10),
            const TopRatedPage()
          ],
        ),
      ),
    );
  }
}
