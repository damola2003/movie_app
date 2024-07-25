import 'package:flutter/material.dart';
import 'package:movie_app/core/constants.dart';

import 'package:movie_app/core/movieService.dart';
import 'package:movie_app/model/movieDetails.dart';
import 'package:movie_app/model/movieRecommedationModel.dart';
// import 'package:movie_app/utils/container.dart';
import 'package:movie_app/utils/detailsContainer.dart';

class MoviedetailsPage extends StatefulWidget {
  final int movieId;
  const MoviedetailsPage({super.key, required this.movieId});

  @override
  State<MoviedetailsPage> createState() => _MoviedetailsPageState();
}

class _MoviedetailsPageState extends State<MoviedetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: movieDetails,
              builder: (context, snapshot) {
                print(widget.movieId);
                // print("this snapshot${snapshot.data}");
                var movie = snapshot.data;

                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 2.5,
                            child: Image.network(
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.cover,
                                "${Constants.imagePath}${movie?.backdropPath.toString()}"),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.grey[200],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie?.title ?? '',
                              style: Constants.headlineStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    padding: const EdgeInsets.all(13),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[900],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.play_arrow,
                                          size: 16,
                                        ),
                                        Text(
                                          "Play",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[900],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(Icons.download),
                                      Text(
                                        "Download",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[900],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(Icons.info),
                                      Text(
                                        "Info",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.grey[800]),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    movie?.overview ?? '',
                                    style: Constants.overviewText,
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              borderRadius: BorderRadius.circular(12),
                              elevation: 7,
                              child: SizedBox(
                                height: 40,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[900],
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 16,
                                            ),
                                            Text(movie!.voteAverage!
                                                .toStringAsFixed(1))
                                          ],
                                        ),
                                      ),
                                      Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[900],
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: const Text("IMDB")),
                                      Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[900],
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Text(
                                              movie.releaseDate.toString())),
                                      Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[900],
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Text(movie.genres!.first.name
                                              .toString())),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            FutureBuilder(
              future: movieRecommmendations,
              builder: (context, snapshot) {
                final movie = snapshot.data;
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "More Like This",
                          style: Constants.movieText,
                        ),
                        SizedBox(
                          height: 750,
                          child: ListView.builder(
                            itemCount: 4,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MoviedetailsPage(
                                          movieId:
                                              movie?.results?[index].id ?? 0),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 14),
                                  child: RecommendationContainer(
                                    image:
                                        '${Constants.imagePath}${movie?.results?[index].posterPath}',
                                    name: '${movie?.results?[index].title}',
                                    ratings:
                                        '${movie?.results?[index].voteAverage ?? 0.0}',
                                    releaseDate:
                                        '${movie?.results?[index].releaseDate}',
                                    genre: '${movie?.results?[index].genreIds}',
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  late Future<MovieDetailsClass> movieDetails;
  late Future<MovieRecommendationClass> movieRecommmendations;
  MovieServices movieServices = MovieServices();
  @override
  void initState() {
    super.initState();
    fetchInitiialData();
  }

  fetchInitiialData() {
    movieDetails = movieServices.getMovieDetail(widget.movieId);
    movieRecommmendations =
        movieServices.getMovieRecommendation(widget.movieId);
    setState(() {});
  }
}
