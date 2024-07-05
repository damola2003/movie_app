import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/utils/carouselContainer.dart';

class TrendingMoviesPage extends StatelessWidget {
  const TrendingMoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "Trending Movies",
            style: GoogleFonts.aBeeZee(
              textStyle: TextStyle(
                  color: Colors.grey[200],
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: CarouselSlider.builder(
              itemCount: 10,
              options: CarouselOptions(
                height: 300,
                autoPlay: true,
                enlargeCenterPage: true,
                pageSnapping: true,
                // viewportFraction: 0.55,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: const Duration(seconds: 1),
              ),
              itemBuilder: (context, itemIndex, pageViewIndex) {
                return const CarouselContainer();
              }),
        ),
      ],
    );
  }
}
