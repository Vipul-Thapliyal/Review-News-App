import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Screens/home_Screen.dart';
import 'package:news_app/Screens/profile_Screen.dart';
import 'package:news_app/Screens/save_Article_Screen.dart';
import 'package:news_app/Screens/search_Screen.dart';

class DashBoardNav extends StatefulWidget {

  static const String routeName = "/dashBoardScreen";

  const DashBoardNav({Key? key}) : super(key: key);

  @override
  State<DashBoardNav> createState() => _DashBoardNavState();
}

class _DashBoardNavState extends State<DashBoardNav> {
  int? _selectedIndex;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    SaveArticleScreen(),
    ProfileScreen(),
  ];


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
    if(kDebugMode) {
      print("Dashboard");
      // String currentTime = DateFormat("yyyy-MM-dd").format(DateTime.now());
      // print(currentTime);
    }
    return Scaffold(
      body:
      Center(
        child: _widgetOptions.elementAt(_selectedIndex!),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
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
        currentIndex: _selectedIndex!,
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
