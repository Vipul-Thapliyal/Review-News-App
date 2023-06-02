import 'package:flutter/material.dart';
import 'package:news_app/Provider/home_Screen_Provider.dart';
import 'package:news_app/Screens/Details_Screens/selected_News_Details_Screen.dart';
import 'package:news_app/Screens/dashboard_Screen.dart';
import 'package:provider/provider.dart';

import 'Screens/Details_Screens/saved_News_Details_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeScreenProvider()),
      ],
      child: MaterialApp(
        routes: {
          "/dashBoardScreen" : (context) => const DashBoardNav(),
          "/savedNewsDetailsScreen" : (context) => const SavedNewsDetailsScreen(),
          "/selectedNewsDetailsScreen" : (context) => const SelectedNewsDetailsScreen(),
        },
        initialRoute: DashBoardNav.routeName,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
