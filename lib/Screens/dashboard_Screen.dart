import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news_app/Screens/home_Screen.dart';
import 'package:news_app/Screens/profile_Screen.dart';
import 'package:news_app/Screens/save_Article_Screen.dart';
import 'package:news_app/Screens/search_Screen.dart';

class DashBoardNav extends StatefulWidget {
  final int currentIndex;
  DashBoardNav({Key? key, required this.currentIndex}) : super(key: key);

  @override
  State<DashBoardNav> createState() => _DashBoardNavState();
}

class _DashBoardNavState extends State<DashBoardNav> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    SaveArticleScreen(),
    ProfileScreen(),
  ];


  @override
  void initState() {
    _selectedIndex = widget.currentIndex;
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
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded,size: 26,),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 26,
            ),
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
