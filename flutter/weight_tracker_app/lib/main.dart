import 'package:flutter/material.dart';
import 'package:weight_tracker_app/screens/save_weight_screen.dart';

import 'package:weight_tracker_app/screens/weight_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Weight Tracker',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.green,
          fontFamily: 'Fira Code',
        ),
        home: const WeightScreen(),
        routes: {
          SaveWeightScreen.routeName: (ctx) => const SaveWeightScreen(),
        });
  }
}
