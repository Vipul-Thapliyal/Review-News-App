import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:news_app/Constants/Routes/routes.dart';
import 'package:news_app/Constants/Routes/routes_Name.dart';
import 'package:news_app/Screens/home_Screen.dart';
import 'package:news_app/Screens/profile_Screen.dart';
import 'package:news_app/Screens/save_Article_Screen.dart';
import 'package:news_app/Screens/search_Screen.dart';

class DashBoardNav extends StatefulWidget {
  DashBoardNav({Key? key}) : super(key: key);

  @override
  State<DashBoardNav> createState() => _DashBoardNavState();
}

class _DashBoardNavState extends State<DashBoardNav> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle = TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold);

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    SaveArticleScreen(),
    ProfileScreen(),
  ];

  // static List _widgetOptions = [
  //   Navigator.pushNamed(BuildContext as BuildContext, RoutesName.home),
  //   Navigator.pushNamed(BuildContext as BuildContext, RoutesName.search),
  //   Navigator.pushNamed(BuildContext as BuildContext, RoutesName.savedArticle),
  //   Navigator.pushNamed(BuildContext as BuildContext, RoutesName.profile),
  // ];


  @override
  void initState() {
    // _selectedIndex = widget.currentIndex;
    _selectedIndex = 0;
    // TODO: implement initState
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Dashboard");
    return Scaffold(
      body:
      Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 26,
              ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 26,),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.save,
              size: 26,
            ),
            label: "Save Article",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 26,
            ),
            label: "Profile",
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        iconSize: 30,
        backgroundColor: Colors.white,
        elevation: 3,
        selectedItemColor: Colors.blue,
        landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
        onTap: _onItemTapped,
      ),
    );
  }
}
