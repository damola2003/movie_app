import 'package:flutter/material.dart';
import 'package:movie_app/pages/homePage.dart';

import 'package:movie_app/pages/settingsPage.dart';
import 'package:movie_app/pages/tvPage.dart';

class BottomnavbarPage extends StatelessWidget {
  const BottomnavbarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 70,
          child: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.movie),
                text: 'Movie',
              ),
              Tab(
                icon: Icon(Icons.tv),
                text: 'TV-Series',
              ),
              // Tab(
              //   icon: Icon(Icons.settings),
              //   text: 'Settings',
              // ),
            ],
            indicatorColor: Colors.red,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.white,
          ),
        ),
        body: const TabBarView(
          children: [
            HomePage(),
            TvPage(),
            // Settingspage(),
          ],
        ),
      ),
    );
  }
}
