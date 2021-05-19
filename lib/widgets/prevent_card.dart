import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:flutter_svg/svg.dart';

class PreventCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const PreventCard({this.image, this.title, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 5,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 24,
                    color: kShadowColor,
                  ),
                ],
              ),
            ),
            Image.asset(image),
            Positioned(
                left: 130,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width - 170,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: kTitleTextStyle.copyWith(fontSize: 16),
                      ),
                      Text(
                        text,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Align(
                          alignment: Alignment.topRight,
                          child: SvgPicture.asset("assets/icons/forward.svg")),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
