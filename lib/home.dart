import 'package:flutter/material.dart';
import 'package:live_clean/pages/CartPage.dart';
import 'package:live_clean/pages/HomePage.dart';
import 'package:live_clean/pages/ProfilePage.dart';
import 'package:live_clean/pages/SearchPage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedPosition = 0;
  // ignore: deprecated_member_use
  List<Widget> listBottomWidget = new List();

  @override
  void initState() {
    super.initState();
    addHomePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ("Search")),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: ("Cart")),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ("Account")),
        ],
        currentIndex: selectedPosition,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.grey.shade100,
        selectedItemColor: Color.fromARGB(255, 0, 255, 255),
        unselectedItemColor: Colors.black,
        onTap: (position) {
          setState(() {
            selectedPosition = position;
          });
        },
      ),
      body: Builder(builder: (context) {
        return listBottomWidget[selectedPosition];
      }),
    );
  }

  void addHomePage() {
    listBottomWidget.add(HomePage());
    listBottomWidget.add(SearchPage());
    listBottomWidget.add(CartPage());
    listBottomWidget.add(ProfilePage());
  }
}
