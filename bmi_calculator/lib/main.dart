import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/input_page.dart';


//this will mainly be the full theme of our mobile app. ^import pages above.

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
              fontSize: 18.0, fontFamily: 'Hind', color: Color(0xFFed648e)),
        ),
        primaryColor: Colors.black,
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xff0b0328)),
        iconTheme: const IconThemeData(color: Color(0xFF5ac88d)),
        scaffoldBackgroundColor: const Color(0xff10043d),
      ),
      home: const InputPage(),
    );
  }
}
