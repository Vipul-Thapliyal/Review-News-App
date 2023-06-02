// import 'package:flutter/material.dart';
// import 'package:news_app/Screens/Details_Screens/saved_news_details_screen.dart';
// import 'package:news_app/Screens/Details_Screens/selected_news_details_screen.dart';
// import 'package:news_app/Screens/dashboard_screen.dart';
//
// class Routes {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//
//     var page;
//     String? routeName = settings.name;
//
//     switch (routeName) {
//       case DashBoardNav.routeName:
//         page = const DashBoardNav();
//         return MaterialPageRoute(builder: (context) => page);
//
//       case SavedNewsDetailsScreen.routeName:
//         page = SavedNewsDetailsScreen();
//         return MaterialPageRoute(builder: (context) => page);
//
//       case SelectedNewsDetailsScreen.routeName:
//
//         page = SelectedNewsDetailsScreen();
//         return MaterialPageRoute(builder: (context) => page);
//
//       default:
//         return MaterialPageRoute(builder: (_) {
//           return Scaffold(
//             appBar: AppBar(
//               title: const Text("Default Page"),
//             ),
//             body: const Center(
//               child: Text("No Route Defined"),
//             ),
//           );
//         });
//     }
//   }
// }