import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/movieService.dart';

// import 'package:movie_app/model/topRatedModel.dart';

import 'package:movie_app/tvModel/popularTvSeriesModel.dart';

import 'package:movie_app/tvModel/ratedTvModel.dart';

import 'package:movie_app/tvModel/tvAiringModel.dart';
import 'package:movie_app/tvModel/tvSeriesModel.dart';

import 'package:movie_app/tvUtils/airTvClass.dart';
import 'package:movie_app/tvUtils/popularTvclass.dart';
import 'package:movie_app/tvUtils/ratedTvSeries.dart';

import 'package:movie_app/tvUtils/tvSeries.dart';

class TvPage extends StatefulWidget {
  const TvPage({super.key});

  @override
  State<TvPage> createState() => _TvPageState();
}

class _TvPageState extends State<TvPage> {
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
                    margin: EdgeInsets.only(top: 20),
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
                future: trendingTvSeries,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return TrendingSeriesPage(
                      headLineText: "Trending Tv Series",
                      data: snapshot.data!,
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            PopularTvSeries(
              future: PopularTvSerie,
              headLineText: "Popular Tv Series",
            ),
            const SizedBox(height: 8),
            AiringTvSeries(
              future: airingToday,
              headLineText: "On The Air",
            ),
            const SizedBox(height: 8),
            TopRatedSeries(
                future: ratedSeries, headLineText: "Top Rated Series")
          ],
        ),
      ),
    );
  }

  late Future<TvClass> trendingTvSeries;
  late Future<PopularTvClass> PopularTvSerie;
  late Future<AiringTvClass> airingToday;
  late Future<TopRatedTvClass> ratedSeries;

  MovieServices movieServices = MovieServices();

  @override
  void initState() {
    trendingTvSeries = movieServices.getTrendingTvSeries();
    PopularTvSerie = movieServices.getPopularTvSeries();
    airingToday = movieServices.getAiringTvSeries();
    ratedSeries = movieServices.getRatedTvSeries();
    super.initState();
  }
}
