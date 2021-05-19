import 'package:flutter/material.dart';
import 'constants.dart';

class SymptomCard extends StatelessWidget {
  final String image;
  final String label;
  final bool isActive;
  const SymptomCard({
    this.isActive = false,
    this.image,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          isActive
              ? BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 20,
                  color: kActiveShadowColor)
              : BoxShadow(
                  offset: Offset(0, 3), blurRadius: 6, color: kShadowColor)
        ],
      ),
      child: Column(
        children: [
          Image.asset(image),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
