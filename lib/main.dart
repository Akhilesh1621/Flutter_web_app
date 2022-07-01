import 'package:app/config/palette.dart';
import 'package:app/screens/screens.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FaceBook Flutter Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
            bodyText1: GoogleFonts.poppins(fontWeight: FontWeight.w400)),

        primarySwatch: Colors.blue,
        primaryColor: Colors.black54,

        //color palette is taken from palette.dart where color is created
        scaffoldBackgroundColor: Palette.scaffold,
      ),
      home: HomeScreen(),
    );
  }
}
