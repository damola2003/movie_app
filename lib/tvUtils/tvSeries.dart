import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:movie_app/core/constants.dart';
import 'package:movie_app/pages/tvDetailsPage.dart';

import 'package:movie_app/tvModel/tvSeriesModel.dart';

class TrendingSeriesPage extends StatelessWidget {
  final TvClass data;
  final String headLineText;
  const TrendingSeriesPage({
    super.key,
    required this.headLineText,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: 12,
            left: 12,
            top: 12,
          ),
          child: Text(headLineText, style: Constants.headlineStyle),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: CarouselSlider.builder(
              itemCount: data.results?.length,
              options: CarouselOptions(
                height: (size.height / 2.2 < 250) ? 250 : size.height / 2.2,
                aspectRatio: 16 / 10,
                // height: 300,
                autoPlay: true,
                enlargeCenterPage: true,
                pageSnapping: true,
                // viewportFraction: 0.55,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: const Duration(seconds: 3),
              ),
              itemBuilder: (context, index, int realIndex) {
                var url = data.results?[index].backdropPath.toString();
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TvDetailsPage(
                            movieId: data.results?[index].id ?? 0),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child:
                            //(url != null)
                            //     ? Center(
                            //         child: CircularProgressIndicator(),
                            //       )
                            //     :
                            Image.network(
                                height: size.height / 3.3,
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.cover,
                                "${Constants.imagePath}${url}"),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "${data.results?[index].name}",
                        style: Constants.movieText,
                      )
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
