import 'package:flutter/material.dart';
import 'package:neetflix/core/colors/colors.dart';


class VideoWidget extends StatelessWidget {
  const VideoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            'https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/l99dylTOAMkwKSr54X5ytiEtnLA.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.black.withOpacity(0.5),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.volume_off,
                  size: 22,
                  color: kWhiteColor,
                )),
          ),
        ),
      ],
    );
  }
}