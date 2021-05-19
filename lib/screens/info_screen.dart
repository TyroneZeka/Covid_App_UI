import 'package:covid_19_update/widgets/constants.dart';
import 'package:covid_19_update/widgets/my_header.dart';
import 'package:covid_19_update/widgets/prevent_card.dart';
import 'package:covid_19_update/widgets/symptom_card.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(
              image: "assets/icons/coronadr.svg",
              topText: "Get to know\n",
              bottomText: "About Covid-19",
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Symptoms",
                    style: kTitleTextStyle,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SymptomCard(
                        image: "assets/images/headache.png",
                        label: "Headache",
                      ),
                      SymptomCard(
                        image: "assets/images/fever.png",
                        label: "Fever",
                        isActive: true,
                      ),
                      SymptomCard(
                        image: "assets/images/caugh.png",
                        label: "Cough",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  Text(
                    "Prevention",
                    style: kTitleTextStyle,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  PreventCard(
                    image: "assets/images/wear_mask.png",
                    title: "Wear a face mask",
                    text:
                        "Since the outbreak of the coronavirus, WHO has encouraged everyone to wear a face mask.",
                  ),
                  PreventCard(
                    image: "assets/images/wash_hands.png",
                    title: "Wash your Hands ",
                    text:
                        "Since the outbreak of the coronavirus, WHO has encouraged everyone to wear a face mask.",
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
