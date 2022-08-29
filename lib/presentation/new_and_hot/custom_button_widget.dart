import 'package:flutter/material.dart';
import 'package:neetflix/core/colors/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {Key? key,
      this.iconSize = 30,
      this.textSize = 18,
      required this.title,
      required this.icon})
      : super(key: key);
  final String title;
  final IconData icon;
  final double iconSize;
  final double textSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: kWhiteColor, size: iconSize),
        Text(
          title,
          style: TextStyle(
            fontSize: textSize,
          ),
        )
      ],
    );
  }
}
