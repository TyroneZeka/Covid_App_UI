import 'package:covid_19_update/services/covid_handler.dart';
import 'package:covid_19_update/services/location.dart';
import 'package:covid_19_update/widgets/constants.dart';
import 'package:covid_19_update/widgets/counter_card.dart';
import 'package:covid_19_update/widgets/my_header.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:date_format/date_format.dart';

class HomeScreen extends StatefulWidget {
  final locationCases;
  HomeScreen({this.locationCases}); //covidData is passed
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _countryController;
  var covid = CovidModel();
  var location = LocationServices();
  int cases;
  int deaths;
  int recovered;
  var date;
  String country;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationCases);
  }

  void updateUI(dynamic locationCases) {
    setState(
      () {
        country = location.country;
        cases = locationCases['cases'];
        deaths = locationCases['deaths'];
        recovered = locationCases['recovered'];
        date = formatDate(
          DateTime.fromMillisecondsSinceEpoch(locationCases['updated']),
          [dd, '-', mm, '-', yy],
        );
      },
    );
  }

  void getSavedData(String name) async {
    var countryCases = await covid.getCountryCases(name);
    updateUI(countryCases);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Header(
                image: "assets/icons/Drcorona.svg",
                topText: "All you need\n",
                bottomText: "is to stay home.",
              ),
              Column(
                children: [
                  Container(
                    // height: MediaQuery.of(context).size.height / 12,
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: Color(0xFFE5E5E5),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            onSubmitted: (value) {
                              getSavedData(value);
                            },
                            decoration: new InputDecoration.collapsed(
                                hintText: country),
                            controller: _countryController,
                            onChanged: (value) {
                              country = value;
                            },
                          ),
                        ),
                        GestureDetector(
                          child: Icon(
                            Icons.search,
                            size: 30,
                          ),
                          onTap: () {
                            getSavedData(country);
                            FocusScope.of(context)
                                .unfocus(); //to remove on screen keyboard after a tap
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 100,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Case Update\n",
                                    style: kTitleTextStyle,
                                  ),
                                  TextSpan(
                                    text: "Newest update $date",
                                    style: TextStyle(color: kTextLightColor),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Text(
                              'See Details',
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 150,
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 4),
                                blurRadius: 30,
                                color: kShadowColor,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CounterCard(
                                cardLabel: "Infected",
                                number: cases, //cases
                                colorCode: kInfectedColor,
                              ),
                              Flexible(
                                child: CounterCard(
                                  cardLabel: "Death",
                                  number: deaths,
                                  colorCode: kDeathColorColor,
                                ),
                              ),
                              CounterCard(
                                cardLabel: "Recovered",
                                number: recovered,
                                colorCode: kRecoveredColor,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 150,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Spread of Virus",
                              style: kTitleTextStyle,
                            ),
                            Text(
                              "See details",
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 3,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 19),
                                blurRadius: 30,
                                color: kShadowColor,
                              ),
                            ],
                          ),
                          child: Image.asset(
                            "assets/images/map.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
