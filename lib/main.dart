import 'package:covid_19_update/screens/loading_page.dart';
// import 'package:covid_19_update/screens/profile_screen.dart';
import 'package:covid_19_update/widgets/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid 19',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: "Poppins",
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: kBodyTextColor,
          ),
        ),
      ),
      home: LoadindScreen(),
      // home: ProfileScreen(),
    );
  }
}
