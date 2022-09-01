import 'package:flutter/material.dart';
import 'package:neetflix/core/colors/colors.dart';
import 'package:neetflix/core/constants.dart';

import '../home/custom_button_widget.dart';
import 'video_widget.dart';

class EveroneWactching extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;

  const EveroneWactching({
    Key? key,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        Text(movieName,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        kHeight,
        Text(
          description,
          style: TextStyle(fontSize: 13),
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
        kHeight50,
        VideoWidget(
          url: posterPath,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtonWidget(
              icon: Icons.share,
              title: 'Share',
              iconSize: 30,
              textSize: 16,
            ),
            kwidth,
            CustomButtonWidget(
              icon: Icons.add,
              title: 'My List',
              iconSize: 30,
              textSize: 16,
            ),
            kwidth,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              title: 'Play',
              iconSize: 30,
              textSize: 16,
            ),
            kwidth,
          ],
        )
      ],
    );
  }
}
