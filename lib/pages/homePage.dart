import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:movie_app/core/movieService.dart';

import 'package:movie_app/model/topRatedModel.dart';
import 'package:movie_app/model/trendingModel.dart';

import 'package:movie_app/model/upcomingMoviesModel.dart';

import 'package:movie_app/movieUtils/popular.dart';
import 'package:movie_app/model/popularModel.dart';

import 'package:movie_app/movieUtils/topRated.dart';
import 'package:movie_app/movieUtils/trendingMovies.dart';
import 'package:movie_app/movieUtils/upcomingMovies.dart';

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
            Padding(
              padding: const EdgeInsets.only(right: 12, left: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.menu,
                    size: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
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
                  const Icon(
                    Icons.notifications,
                    size: 30,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            FutureBuilder(
                future: trendingMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return TrendingMoviesPage(
                      headLineText: "Trending Movies",
                      data: snapshot.data!,
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            PopularMovies(
              headLineText: 'Popular Movies',
              future: popularMovies,
            ),
            UpcomingMoviesPage(
                future: UpcomingMovies, headLineText: 'Upcoming Movies'),
            TopRatedPage(
              future: topRatedMovies,
              headLineText: 'Top Rated Movies',
            ),
          ],
        ),
      ),
    );
  }

  late Future<MovieClasss> trendingMovies;
  late Future<PopularClass> popularMovies;
  late Future<UpcomingClass> UpcomingMovies;
  late Future<topRatedClass> topRatedMovies;

  MovieServices movieServices = MovieServices();

  @override
  void initState() {
    trendingMovies = movieServices.getTrendingMovies();
    popularMovies = movieServices.getPopularMovies();
    UpcomingMovies = movieServices.getUpcomingMovies();
    topRatedMovies = movieServices.getTopRatedMovies();
    super.initState();
  }
}
