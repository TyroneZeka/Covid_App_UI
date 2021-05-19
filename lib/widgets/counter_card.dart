import 'package:flutter/material.dart';
import 'constants.dart';

class CounterCard extends StatelessWidget {
  final String cardLabel;
  final int number;
  final Color colorCode;
  CounterCard({this.cardLabel, this.number, this.colorCode});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(6),
          height: MediaQuery.of(context).size.height / 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colorCode.withOpacity(.26),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: colorCode,
                width: 5,
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 100,
        ),
        Text(
          '$number',
          style: TextStyle(
            fontSize: 25,
            color: colorCode,
          ),
        ),
        Text(
          cardLabel,
          style: kSubTextStyle,
        ),
      ],
    );
  }
}
