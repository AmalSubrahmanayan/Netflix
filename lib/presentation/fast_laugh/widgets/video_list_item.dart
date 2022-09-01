import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neetflix/application/fast_laugh/fast_laugh_bloc.dart';

import 'package:neetflix/core/colors/colors.dart';
import 'package:neetflix/core/constants.dart';
import 'package:neetflix/domain/core/downloads/models/downloads.dart';
import 'package:video_player/video_player.dart';

import 'package:share_plus/share_plus.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;
  const VideoListItemInheritedWidget(
      {Key? key, required this.widget, required this.movieData})
      : super(key: key, child: widget);

  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListItemInheritedWidget.of(context)?.movieData.posterpath;

    final videoUrl = dummyVideoUrl[index % dummyVideoUrl.length];
    return Stack(
      children: [
        FastLaughVideoPlayer(
          onChanged: (bool) {},
          videoUrl: videoUrl,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //l
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off,
                      color: kWhiteColor,
                      size: 30,
                    ),
                  ),
                ),
                //r
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: posterPath == null
                            ? null
                            : NetworkImage('$imageAppendUrl$posterPath'),
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: likedVideosIdsNotifier,
                      builder: (BuildContext c, Set<int> newLikedListIds,
                          Widget? _) {
                        final _index = index;
                        if (newLikedListIds.contains(_index)) {
                          return GestureDetector(
                            onTap: () {
                              // BlocProvider.of<FastLaughBloc>(context)
                              //     .add(UnlikeVideo(id: _index));
                              likedVideosIdsNotifier.value.remove(_index);
                              likedVideosIdsNotifier.notifyListeners();
                            },
                            child: const VideoActionsWidget(
                              icon: Icons.favorite,
                              title: 'Liked',
                            ),
                          );
                        }
                        return GestureDetector(
                          onTap: () {
                            // BlocProvider.of<FastLaughBloc>(context)
                            //     .add(LikeVideo(id: _index));
                            likedVideosIdsNotifier.value.add(_index);
                            likedVideosIdsNotifier.notifyListeners();
                          },
                          child: const VideoActionsWidget(
                            icon: Icons.emoji_emotions,
                            title: 'LOL',
                          ),
                        );
                      },
                    ),
                    const VideoActionsWidget(
                      icon: Icons.add,
                      title: 'MY LIST',
                    ),
                    GestureDetector(
                      onTap: () {
                        final movieName =
                            VideoListItemInheritedWidget.of(context)
                                ?.movieData
                                .posterpath;
                        if (movieName != null) {
                          Share.share(movieName);
                        }
                        VideoActionsWidget(icon: Icons.share, title: 'Share');
                      },
                      child: const VideoActionsWidget(
                        icon: Icons.near_me_outlined,
                        title: 'Share',
                      ),
                    ),
                    const VideoActionsWidget(
                      icon: Icons.play_arrow,
                      title: 'Play',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionsWidget({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          Text(
            title,
            style: TextStyle(color: kWhiteColor, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class FastLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlaying) onChanged;
  FastLaughVideoPlayer(
      {Key? key, required this.onChanged, required this.videoUrl})
      : super(key: key);

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {});
      _videoPlayerController.play();
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),
            )
          : Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
