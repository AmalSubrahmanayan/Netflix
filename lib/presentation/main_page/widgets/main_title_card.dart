import 'package:flutter/material.dart';
import 'package:neetflix/core/constants.dart';
import 'package:neetflix/presentation/main_page/widgets/main_title.dart';

import 'main_card.dart';

class MainCardAndTitle extends StatelessWidget {
  MainCardAndTitle({Key? key, required this.title,
  required this.posterList}) : super(key: key);
  String title;
  final List<String>posterList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTitle(title: title),
          kHeight,
          LimitedBox(
            maxHeight: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(posterList.length,
               (index) => Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: MainCardsWidget(imageUrl: posterList[index],),
               )),
            ),
          )
        ],
      ),
    );
  }
}