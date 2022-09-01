import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neetflix/presentation/fast_laugh/widgets/video_list_item.dart';

import '../../application/fast_laugh/fast_laugh_bloc.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(const Initialize());
    });
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FastLaughBloc, FastLaughState>(
          builder: (context, state) {
            if (state.isLOading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.isError) {
              return const Center(
                child: Text('Error while getting data'),
              );
            } else if (state.videoList.isEmpty) {
              return Center(
                child: Text('Video list is  empty'),
              );
            } else {
              return PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(10, (index) {
                  return VideoListItemInheritedWidget(
                    widget:
                        VideoListItem(key: Key(index.toString()), index: index),
                    movieData: state.videoList[index],
                  );
                }),
              );
            }
          },
        ),
      ),
    );
  }
}
