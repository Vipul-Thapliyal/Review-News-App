import 'package:flutter/material.dart';
import 'package:news_app/Constants/Routes/named_routes.dart';
import 'package:news_app/Constants/Routes/routes.dart';
import 'package:news_app/Provider/home_Screen_Provider.dart';
import 'package:news_app/Screens/Details_Screens/selected_News_Details_Screen.dart';
import 'package:news_app/Screens/dashboard_Screen.dart';
import 'package:news_app/Screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'Screens/Details_Screens/saved_News_Details_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeScreenProvider()),
      ],
      child: MaterialApp(
        // routes: {
        //   DashBoardNav.routeName : (context) => const DashBoardNav(),
        //   SavedNewsDetailsScreen.routeName : (context) => const SavedNewsDetailsScreen(),
        //   SelectedNewsDetailsScreen.routeName : (context) => const SelectedNewsDetailsScreen(),
        // },
        onGenerateRoute: Routes.generateRoute,
        initialRoute: DashBoardNav.routeName,
        // initialRoute: HomeScreen.routeName,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
