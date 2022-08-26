import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:neetflix/core/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 45,
              height: 150,
            ),
            Container(
              width: 130,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: kRadius10,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://www.themoviedb.org/t/p/w220_and_h330_face/qvqyDj34Uivokf4qIvK4bH0m0qF.jpg',
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 13,
          bottom: 1,
          child: BorderedText(
            strokeWidth: 10.0,
            child: Text(
              '${index + 1}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 100,
                decoration: TextDecoration.none,
                decorationColor: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
