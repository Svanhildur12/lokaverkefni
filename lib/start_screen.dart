import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class StartScreen extends StatelessWidget {
  const StartScreen(this.startApp,{super.key});


  final void Function() startApp;

  @override
  Widget build(context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.max, children: [
        Image.asset(
          'lib/assets/noose.png',
          width: 350,
          alignment: Alignment.center,
        ),
        const SizedBox(height: 80),
        Material(
          borderRadius: BorderRadius.circular(12),
            elevation: 5.0,
            child: ElevatedButton.icon(
              onPressed: startApp,
              icon: const Icon(Icons.play_arrow_rounded),
              label: const Text('START GAME'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                fixedSize: const Size(250, 50),
                backgroundColor: Colors.red,
                textStyle: GoogleFonts.syne(
                  fontWeight: FontWeight.bold,
              ))),
        ),
      ]),
    );
  }




}
