import 'package:covidcounter/screens/india_home_page.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'India',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.indigo[900],
            elevation: 0,
          ),
          textTheme: TextTheme().apply(
            bodyColor: Colors.indigo[900],
          ),
          scaffoldBackgroundColor: Color(0xE1C1B7B7)),
      home: IndiaHomePage(),
    );
  }
}
