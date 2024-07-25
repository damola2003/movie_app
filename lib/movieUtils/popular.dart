import 'package:flutter/material.dart';

import 'package:movie_app/core/constants.dart';

import 'package:movie_app/model/popularModel.dart';
import 'package:movie_app/pages/movieDetailsPage.dart';

import 'package:movie_app/utils/container.dart';

class PopularMovies extends StatelessWidget {
  final Future<PopularClass> future;
  final String headLineText;
  const PopularMovies({
    super.key,
    required this.future,
    required this.headLineText,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          var data = snapshot.data?.results;
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(headLineText, style: Constants.headlineStyle),
                ),
                SizedBox(height: 5),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            right: 8, left: 8, bottom: 4, top: 4),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MoviedetailsPage(
                                    movieId: data?[index].id ?? 0),
                              ),
                            );
                          },
                          child: ContainerBox(
                              image:
                                  '${Constants.imagePath}${data?[index].posterPath}',
                              title: '${data?[index].title}'),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
