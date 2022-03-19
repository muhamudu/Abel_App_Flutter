import 'package:flutter/material.dart';
import 'package:live_clean/welcomepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Live Clean',
      theme: ThemeData(
        fontFamily: 'Lato',
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: welcomePage(),
    );
  }
}
