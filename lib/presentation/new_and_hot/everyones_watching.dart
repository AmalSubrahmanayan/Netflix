import 'package:flutter/material.dart';
import 'package:neetflix/core/colors/colors.dart';
import 'package:neetflix/core/constants.dart';

import '../home/custom_button_widget.dart';
import 'video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        const Text('Friends',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: kWhiteColor,
            )),
        kHeight,
        const Text(
          "This hit sitcom followa the merry adventures of six 20-something pals as they navigate the pitfalls of work,life and love in 1990's",
          style: TextStyle(
            color: kColorGray,
          ),
        ),
        kHeight50,
        VideoWidget(),
        kHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtonWidget(
              title: 'Share',
              icon: Icons.share,
              iconSize: 25,
              textSize: 16,
            ),
            kwidth,
            CustomButtonWidget(
              title: 'My List',
              icon: Icons.add,
              iconSize: 25,
              textSize: 16,
            ),
            kwidth,
            CustomButtonWidget(
              title: 'Remind',
              icon: Icons.play_arrow,
              iconSize: 25,
              textSize: 16,
            ),
            kwidth
          ],
        ),
      ],
    );
  }
}
