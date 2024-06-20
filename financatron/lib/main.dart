import 'package:flutter/material.dart';

import 'package:financatron/screens/landing_page.dart';
import 'package:financatron/widget/background_image_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Financatron',
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFFFFFFF),
            ),
          ),
          // Example of how to change the OutlineInputBorder when it's selected
          // focusedBorder: OutlineInputBorder(
          //   borderSide: BorderSide(
          //     color: Color(0xFFFFFFFF),
          //   ),
          // ),
          labelStyle: TextStyle(
            color: Color(0xFFFFFFFF),
          ),
        ),
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: const Color(0xFFFFFFFF),
              secondary: Colors.pinkAccent,
              // errorColor: Colors.red,
            ),
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          headline6: TextStyle(),
          bodyText1: TextStyle(),
          bodyText2: TextStyle(), // App text theme
          subtitle1: TextStyle(), // Input text theme
        ).apply(
          bodyColor: const Color(0xFFFFFFFF),
          displayColor: const Color(0xFFFFFFFF),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: const Color(0xFF636363),
              onPrimary: const Color(0xFFFFFFFF),
              textStyle: const TextStyle(fontSize: 20)),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BackgroundImageWidget(
      image: const AssetImage('assets/images/background.jpeg'),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(children: const [
          LandingPage(),
        ]),
      ),
    );
  }
}
