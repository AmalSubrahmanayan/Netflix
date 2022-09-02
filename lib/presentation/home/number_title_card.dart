import 'package:flutter/material.dart';
import 'package:neetflix/core/constants.dart';
import 'package:neetflix/presentation/main_page/widgets/main_title.dart';

import 'number_card.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({Key? key, required this.posterList}) : super(key: key);
  final List<String> posterList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: 'Top 10 Tv Shows In India Today '),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
                posterList.length,
                (index) => NumberCardWidget(
                      imageUrl: posterList[index],
                      index: index,
                    )),
          ),
        )
      ],
    );
  }
}
