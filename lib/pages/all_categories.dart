// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:live_clean/home.dart';
import 'package:live_clean/pages/HomePage.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 0, 255, 255),
            elevation: 0.0,
            centerTitle: true,
            toolbarHeight: 60.2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(360)),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back_ios_new,
                    color: Color.fromARGB(255, 255, 255, 255)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
            ],
            title: Text('All Categories',
                style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255))),
          ),
          body: SingleChildScrollView(
              child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.all(25),
              child: OutlineButton(
                child: Text(
                  "Deep | General Cleaning",
                  style: TextStyle(fontSize: 20.0),
                ),
                highlightedBorderColor: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: OutlineButton(
                child: Text(
                  "Fumigation & Pest Control",
                  style: TextStyle(fontSize: 20.0),
                ),
                highlightedBorderColor: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: OutlineButton(
                child: Text(
                  "X-Press Laundry & Dry Cleaning",
                  style: TextStyle(fontSize: 20.0),
                ),
                highlightedBorderColor: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: OutlineButton(
                child: Text(
                  "X-Press Shoe Care [Shine&Wash]",
                  style: TextStyle(fontSize: 20.0),
                ),
                highlightedBorderColor: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: OutlineButton(
                child: Text(
                  "Carpet | Sofa Cleaning",
                  style: TextStyle(fontSize: 20.0),
                ),
                highlightedBorderColor: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: OutlineButton(
                child: Text(
                  "Move in | Out Cleaning",
                  style: TextStyle(fontSize: 20.0),
                ),
                highlightedBorderColor: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: OutlineButton(
                child: Text(
                  "Lawn & Garden Care",
                  style: TextStyle(fontSize: 20.0),
                ),
                highlightedBorderColor: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: OutlineButton(
                child: Text(
                  "Water Tank Cleaning",
                  style: TextStyle(fontSize: 20.0),
                ),
                highlightedBorderColor: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
            ),
          ]))),
    );
  }
}
