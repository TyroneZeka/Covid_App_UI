import 'package:covid_19_update/screens/home_screen.dart';
// import 'package:covid_19_update/screens/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_update/services/covid_handler.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadindScreen extends StatelessWidget {
  Future<dynamic> getCurrentPosition() async {
    var covidData = await CovidModel().getLocationCases();
    print(covidData);
    return covidData;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
      screenFunction: () async {
        var covidData = await CovidModel().getLocationCases();
        return HomeScreen(
          locationCases: covidData,
        );
      },
      backgroundColor: Colors.deepOrange,
      splash: Container(
        // height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: SpinKitPumpingHeart(
                color: Colors.orange,
                size: MediaQuery.of(context).size.height / 4,
              ),
            ),
            Expanded(
              child: Text(
                'Nerd Med',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
