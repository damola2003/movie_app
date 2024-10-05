import 'dart:convert';

import 'package:movie_app/model/movieDetails.dart';
import 'package:movie_app/model/movieRecommedationModel.dart';
import 'package:movie_app/model/popularModel.dart';
import 'package:movie_app/model/topRatedModel.dart';
import 'package:movie_app/model/trendingModel.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/core/constants.dart';
import 'package:movie_app/model/upcomingMoviesModel.dart';
import 'package:movie_app/tvModel/popularTvSeriesModel.dart';

import 'package:movie_app/tvModel/ratedTvModel.dart';

import 'package:movie_app/tvModel/seriesDetailModel.dart';

import 'package:movie_app/tvModel/tvAiringModel.dart';
import 'package:movie_app/tvModel/tvSeriesModel.dart';

class MovieServices {
  final trendingurl =
      '${Constants.baseUrl}trending/movie/day?api_key=${Constants.apiKey}';
  final popularApiUrl =
      '${Constants.baseUrl}movie/popular?api_key=${Constants.apiKey}';
  final topRatedApiUrl =
      '${Constants.baseUrl}movie/top_rated?api_key=${Constants.apiKey}';
  final UpComingApiUrl =
      '${Constants.baseUrl}movie/upcoming?api_key=${Constants.apiKey}';
  final TvSeriesUrl =
      '${Constants.baseUrl}trending/tv/day?api_key=${Constants.apiKey}';
  final PopularTvUrl =
      "${Constants.baseUrl}tv/popular?api_key=${Constants.apiKey}";
  final TopRatedTvUrl =
      "${Constants.baseUrl}tv/top_rated?api_key=${Constants.apiKey}";

  Future<MovieClasss> getTrendingMovies() async {
    final response = await http.get(
      Uri.parse(trendingurl),
    );

    if (response.statusCode == 200) {
      print("success${response.statusCode}");
      return MovieClasss.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load Movie data");
    }
  }

  Future<PopularClass> getPopularMovies() async {
    final response = await http.get(
      Uri.parse(popularApiUrl),
    );
    if (response.statusCode == 200) {
      // print("hello${response}");
      print("success${response.body}");
      return PopularClass.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load Movie data");
    }
  }

  Future<UpcomingClass> getUpcomingMovies() async {
    final response = await http.get(
      Uri.parse(UpComingApiUrl),
    );
    if (response.statusCode == 200) {
      // log("success${response.body}");
      return UpcomingClass.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load Movie data");
    }
  }

  Future<topRatedClass> getTopRatedMovies() async {
    final response = await http.get(
      Uri.parse(topRatedApiUrl),
    );
    if (response.statusCode == 200) {
      return topRatedClass.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load Movie data");
    }
  }

  Future<TvClass> getTrendingTvSeries() async {
    final response = await http.get(
      Uri.parse(TvSeriesUrl),
    );

    if (response.statusCode == 200) {
      return TvClass.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load Movie data");
    }
  }

  Future<PopularTvClass> getPopularTvSeries() async {
    final response = await http.get(
      Uri.parse(PopularTvUrl),
    );

    if (response.statusCode == 200) {
      return PopularTvClass.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load Movie data");
    }
  }

  Future<AiringTvClass> getAiringTvSeries() async {
    final response = await http.get(
      Uri.parse(PopularTvUrl),
    );

    if (response.statusCode == 200) {
      return AiringTvClass.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load Movie data");
    }
  }

  Future<TopRatedTvClass> getRatedTvSeries() async {
    final response = await http.get(
      Uri.parse(TopRatedTvUrl),
    );

    if (response.statusCode == 200) {
      return TopRatedTvClass.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load Movie data");
    }
  }

  Future<MovieDetailsClass> getMovieDetail(int movieId) async {
    final MovieDetailUrl =
        "${Constants.baseUrl}movie/$movieId?api_key=${Constants.apiKey}";
    final response = await http.get(
      Uri.parse(MovieDetailUrl),
    );
    // print("hereresponse${response.body}");
    // print(response.statusCode);
    if (response.statusCode == 200) {
      // print("hola!");
      // print(json.decode(response.body));
      // MovieDetailsClass deee =
      //     MovieDetailsClass.fromJson(json.decode(response.body));
      // print("checking...");
      return MovieDetailsClass.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load Movie details");
    }
  }

  Future<MovieRecommendationClass> getMovieRecommendation(int movieId) async {
    final MovieRecommendationUrl =
        "${Constants.baseUrl}movie/$movieId/recommendations?api_key=${Constants.apiKey}";
    final response = await http.get(
      Uri.parse(MovieRecommendationUrl),
    );
    // print("hereresponse${response.body}");
    // print(response.statusCode);
    if (response.statusCode == 200) {
      // print("hola!");
      // print(json.decode(response.body));
      // MovieDetailsClass deee =
      //     MovieDetailsClass.fromJson(json.decode(response.body));
      // print("checking...");
      return MovieRecommendationClass.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load Movie details");
    }
  }

  Future<SeriesDetailsClass> getDetailTvSeries(int movieId) async {
    final tvDetailUrl =
        "${Constants.baseUrl}tv/$movieId?api_key=${Constants.apiKey}";
    final response = await http.get(
      Uri.parse(tvDetailUrl),
    );
    // print("hereresponse${response.body}");
    // print(response.statusCode);
    if (response.statusCode == 200) {
      // print("hola!");
      // print(json.decode(response.body));
      SeriesDetailsClass deee =
          SeriesDetailsClass.fromJson(json.decode(response.body));

      print("checking...${json.decode(response.body)}");
      return SeriesDetailsClass.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load Movie details");
    }
  }

  Future<MovieRecommendationClass> gettvRecommendation(int movieId) async {
    final tvRecommendationUrl =
        "${Constants.baseUrl}tv/$movieId/recommendations?api_key=${Constants.apiKey}";
    final response = await http.get(
      Uri.parse(tvRecommendationUrl),
    );
    // print("hereresponse${response.body}");
    // print(response.statusCode);
    if (response.statusCode == 200) {
      // print("hola!");
      // print(json.decode(response.body));
      // MovieDetailsClass deee =
      //     MovieDetailsClass.fromJson(json.decode(response.body));
      // print("checking...");
      return MovieRecommendationClass.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load Movie details");
    }
  }
}
