import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Settingspage extends StatefulWidget {
  const Settingspage({super.key});

  @override
  State<Settingspage> createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          margin: EdgeInsets.only(top: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Cirama",
                style: GoogleFonts.aBeeZee(
                  textStyle: const TextStyle(
                      color: Colors.red,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Icon(
                Icons.movie_creation,
                size: 35,
                color: Color.fromARGB(255, 84, 22, 17),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ]),
    );
  }
}
