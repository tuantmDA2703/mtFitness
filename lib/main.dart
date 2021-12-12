import 'package:flutter/material.dart';
import 'package:mt_fitness/screens/splash_page.dart';

void main() {
  runApp(const MtFitnessApp());
}

class MtFitnessApp extends StatelessWidget {
  const MtFitnessApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashPage(),
    );
  }
}
