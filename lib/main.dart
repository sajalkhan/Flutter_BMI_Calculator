
import 'package:flutter/material.dart';
import 'Ui/HomePage.dart';
import 'Ui/ResultPage.dart';

void main() => runApp(BmiCalculator());

class BmiCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0Xff111639),
        scaffoldBackgroundColor: Color(0xff0C1135),
      ),
      initialRoute: '/',
      routes: {
        '/': (context)=> InputPage(),
        '/result': (context)=> ResultPage()
      },
    );
  }
}
