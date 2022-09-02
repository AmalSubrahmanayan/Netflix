import 'package:flutter/material.dart';
import 'package:neetflix/core/constants.dart';


class MainCardsWidget extends StatelessWidget {
  MainCardsWidget({

    Key? key,required this.imageUrl
  }) : super(key: key);
  String imageUrl;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: kRadius10,
          image: DecorationImage(fit: BoxFit.fill,
              image: NetworkImage(imageUrl
                  ))),
      width: 150,
      height: 250,
    );
  }
}
