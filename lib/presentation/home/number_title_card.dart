import 'package:flutter/material.dart';
import 'package:neetflix/presentation/main_page/widgets/main_title.dart';

import 'number_card.dart';

class NumberTitleCar extends StatelessWidget {
  const NumberTitleCar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(
          title: 'Top 10 Tv Shows In India Today',
        ),
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (index) => NumberCard(
                index: index,
              ),
            ),
          ),
        )
      ],
    );
  }
}
