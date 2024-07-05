import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/utils/container.dart';

class TopRatedPage extends StatelessWidget {
  const TopRatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "Top Rated",
            style: GoogleFonts.aBeeZee(
              textStyle: TextStyle(
                  color: Colors.grey[200],
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: 200, // Add a specific height
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (context, index) {
              return const Padding(
                padding: const EdgeInsets.all(8.0),
                child: ContainerBox(image: '', title: ''),
              );
            },
          ),
        ),
      ],
    );
  }
}
