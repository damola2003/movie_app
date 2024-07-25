import 'package:flutter/material.dart';

import 'package:movie_app/core/constants.dart';

class ContainerBox extends StatelessWidget {
  final String image;
  final String title;
  const ContainerBox({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: MediaQuery.of(context).size.width / 2.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
                image,
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomStart,
              child: Text(title, style: Constants.movieText),
            )
          ],
        ),
      ),
    );
  }
}
