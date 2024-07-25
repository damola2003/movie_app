import 'package:flutter/material.dart';

import 'package:movie_app/core/constants.dart';
import 'package:movie_app/pages/tvDetailsPage.dart';

import 'package:movie_app/tvModel/tvAiringModel.dart';
import 'package:movie_app/utils/container.dart';

class AiringTvSeries extends StatelessWidget {
  final Future<AiringTvClass> future;
  final String headLineText;
  const AiringTvSeries({
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
                const SizedBox(height: 5),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(right: 8, left: 8, top: 4),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TvDetailsPage(
                                    movieId: data?[index].id ?? 0),
                              ),
                            );
                          },
                          child: ContainerBox(
                              image:
                                  '${Constants.imagePath}${data?[index].posterPath}',
                              title: '${data?[index].name}'),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
