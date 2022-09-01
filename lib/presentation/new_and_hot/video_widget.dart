import 'package:flutter/material.dart';
import 'package:neetflix/core/colors/colors.dart';

class VideoWidget extends StatelessWidget {
  final String url;
  const VideoWidget({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: Image(
            image: NetworkImage(url),
            fit: BoxFit.cover,
            loadingBuilder:
                (BuildContext _, Widget child, ImageChunkEvent? progress) {
              if (progress == null) {
                return child;
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                );
              }
            },
            errorBuilder: (BuildContext _, Object a, StackTrace? trace) {
              return Center(
                child: Icon(Icons.wifi),
              );
            },
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            radius: 22,
            backgroundColor: Colors.black.withOpacity(0.5),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.volume_off,
                  color: kWhiteColor,
                  size: 20,
                )),
          ),
        )
      ],
    );
  }
}
