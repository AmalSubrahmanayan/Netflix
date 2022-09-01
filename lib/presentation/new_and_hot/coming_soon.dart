import 'package:flutter/material.dart';
import 'package:neetflix/core/colors/colors.dart';
import 'package:neetflix/core/constants.dart';
import 'package:neetflix/presentation/home/custom_button_widget.dart';

import 'video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;

  const ComingSoonWidget(
      {Key? key,
      required this.id,
      required this.month,
      required this.day,
      required this.posterPath,
      required this.movieName,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 50,
          height: 420,
          child: Column(
            children: [
              Text(
                month,
                style: TextStyle(fontSize: 18, color: kColorGray),
              ),
              Text(
                day,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
              )
            ],
          ),
        ),
        SizedBox(
          height: 420,
          width: size.width - 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(
                url: posterPath,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(movieName,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18,
                            // letterSpacing: -5,
                            fontWeight: FontWeight.bold)),
                  ),
                  Spacer(),
                  CustomButtonWidget(
                    icon: Icons.notifications,
                    title: 'Remain dMe',
                    iconSize: 20,
                    textSize: 16,
                  ),
                  CustomButtonWidget(
                    icon: Icons.info,
                    title: 'info',
                    iconSize: 20,
                    textSize: 16,
                  )
                ],
              ),
              Text('Coming on $day $month'),
              kHeight,
              Text(movieName,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              kHeight,
              Text(
                style: TextStyle(fontSize: 13),
                description,
                maxLines: 4,
              ),
            ],
          ),
        )
      ],
    );
  }
}
