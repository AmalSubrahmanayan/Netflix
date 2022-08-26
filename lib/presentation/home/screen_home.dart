import 'package:flutter/material.dart';

import '../main_page/widgets/main_title_card.dart';
import 'number_title_card.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: NumberTitleCard(),
        ),
      ),
    );
  }
}

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        MainTitleCard(
          title: 'Relesed in the past year',
        ),
        MainTitleCard(
          title: 'Trending Now',
        ),
        NumberTitleCar(),
        MainTitleCard(
          title: 'Tence Dramas',
        ),
        MainTitleCard(
          title: 'South Indian Cinema',
        ),
      ],
    );
  }
}
