import 'package:flutter/material.dart';
import 'package:lab_flutter/lab9/screens/loading_screen.dart';

class NewWeatherScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData.dark(), home: LoadingScreen());
  }

}