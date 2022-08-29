import 'package:flutter/material.dart';
import 'package:neetflix/core/colors/colors.dart';
import 'package:neetflix/core/constants.dart';
import 'package:neetflix/presentation/home/custom_button_widget.dart';

import 'video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text('FEB',
                  style: TextStyle(
                    fontSize: 16,
                    color: kColorGray,
                  )),
              Text(
                '11',
                style: TextStyle(
                  fontSize: 30,
                  letterSpacing: 4,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        Column(
          children: [
            SizedBox(
              width: size.width - 50,
              height: 450,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VideoWidget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'TALL GIRL 2',
                        style: TextStyle(
                          fontSize: 30,
                          letterSpacing: -2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CustomButtonWidget(
                              title: 'Remind me',
                              icon: Icons.alarm,
                              iconSize: 10,
                              textSize: 10,
                            ),
                            kwidth,
                            CustomButtonWidget(
                              title: 'info',
                              icon: Icons.info,
                              iconSize: 10,
                              textSize: 10,
                            ),
                            kwidth,
                          ],
                        ),
                      )
                    ],
                  ),
                  kHeight,
                  Text(
                    'Coming on Friday',
                  ),
                  kHeight,
                  const Text(
                    'Tall girl 2',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kColorGray,
                    ),
                  ),
                  kHeight,
                  Text(
                    'Landing the lead in the schook mudical is a dream come true for Jodi, until the  presssure sends her confidence and her relationship in to a tailspin',
                    style: TextStyle(
                      color: kColorGray,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
