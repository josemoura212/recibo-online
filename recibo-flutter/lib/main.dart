import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recibo/src/form/form_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const FormView(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        textTheme: GoogleFonts.radioCanadaTextTheme(),
      ),
    );
  }
}
