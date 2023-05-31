import 'package:flutter/material.dart';
import 'package:news_app/Constants/Routes/routes_Name.dart';
import 'package:news_app/Screens/Details_Screens/saved_News_Details_Screen.dart';
import 'package:news_app/Screens/Details_Screens/selected_News_Details_Screen.dart';
import 'package:news_app/Screens/dashboard_Screen.dart';
import 'package:news_app/Screens/home_Screen.dart';
import 'package:news_app/Screens/profile_Screen.dart';
import 'package:news_app/Screens/save_Article_Screen.dart';
import 'package:news_app/Screens/search_Screen.dart';

class Routes {
  // static Route<dynamic> generateRoute(RouteSettings settings) {
  static Route<dynamic> generateRoute(passedRoute) {
    // function will return a Route, generateRoute(RouteSetting accepts a String parameter)
    // switch(settings.name) {
    switch(passedRoute.name) {
      case RoutesName.dashBoard:
        return MaterialPageRoute(builder: (context) => DashBoardNav());

      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case RoutesName.search:
        return MaterialPageRoute(builder: (context) => const SearchScreen());

      case RoutesName.savedArticle:
        return MaterialPageRoute(builder: (context) => const SaveArticleScreen());

      case RoutesName.profile:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());



      // case RoutesName.selectedNewsDetails:
      //   return MaterialPageRoute(builder: (context) => SelectedNewsDetailsScreen());
      //
      // case RoutesName.savedNewsDetails:
      //   return MaterialPageRoute(builder: (context) => SavedNewsDetailsScreen());


      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Default Page"),
            ),
            body: Center(
              child: Text("No Route Defined"),
            ),
          );
        });
    }
  }
}