import 'package:flutter/material.dart';
import 'package:news_app/Provider/home_Screen_Provider.dart';
import 'package:news_app/Screens/Details_Screens/saved_news_details_screen.dart';
import 'package:news_app/Screens/Details_Screens/selected_news_details_screen.dart';
import 'package:news_app/Screens/dashboard_screen.dart';

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {

    Widget page;
    String? routeName = settings.name;
    final args = settings.arguments;

    switch (routeName) {
      case DashBoardNav.routeName:
        page = const DashBoardNav();
        return MaterialPageRoute(builder: (context) => page);

      case SavedNewsDetailsScreen.routeName:
        var arguments = settings.arguments as Map<String, dynamic>;
        page = const SavedNewsDetailsScreen();
        return MaterialPageRoute(
          builder: (context) => page,
          settings: RouteSettings(arguments: arguments)
        );

      case SelectedNewsDetailsScreen.routeName:
        if(args is int) {
          page = SelectedNewsDetailsScreen(index: args);
          return MaterialPageRoute(
            builder: (context) => page,
          );
        }
        break;

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Default Page"),
            ),
            body: const Center(
              child: Text("No Route Defined"),
            ),
          );
        });

        // return null;
    }
    return null;
  }
}