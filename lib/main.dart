import 'package:flutter/material.dart';
import 'package:news_app/Constants/Routes/routes.dart';
import 'package:news_app/Provider/home_Screen_Provider.dart';
import 'package:news_app/Screens/dashboard_Screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeScreenProvider()),
      ],
      child: MaterialApp(
        onGenerateRoute: Routes.generateRoute,
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
