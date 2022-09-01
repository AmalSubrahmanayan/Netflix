import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:neetflix/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:neetflix/core/colors/colors.dart';
import 'package:neetflix/core/constants.dart';
import 'package:neetflix/presentation/new_and_hot/coming_soon.dart';
import 'package:neetflix/presentation/new_and_hot/everyones_watching.dart';

// ignore_for_file: unnecessary_const

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: const Text(
              'New & Hot',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
            actions: [
              const Icon(
                Icons.cast,
                color: Colors.white,
              ),
              kwidth,
              Container(
                width: 30,
                height: 30,
                color: Colors.blue,
              ),
              kwidth,
            ],
            bottom: TabBar(
                labelColor: kButtonColorBlack,
                unselectedLabelColor: kWhiteColor,
                isScrollable: true,
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                indicator:
                    BoxDecoration(color: kWhiteColor, borderRadius: kRadius30),
                tabs: const [
                  Tab(
                    text: '🍿 Comming soon',
                  ),
                  Tab(
                    text: "👀 Eveyone's watching",
                  )
                ]),
          ),
        ),
        body: TabBarView(children: [
          ComingSoonList(key: Key('coming_soon')),
          EveryoneIsWatching(
            key: Key('everyone_is_watching'),
          )
        ]),
      ),
    );
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(LoadDataInComingSoon());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context).add(LoadDataInComingSoon());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isError) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.isLOading) {
            return Center(
              child: Text('Error while loading soon list'),
            );
          } else if (state.comingSoonList.isEmpty) {
            return Center(
              child: Text('Coming soon list is empty'),
            );
          } else {
            return ListView.builder(
                padding: EdgeInsets.only(top: 18),
                itemCount: state.comingSoonList.length,
                itemBuilder: (context, index) {
                  final movie = state.comingSoonList[index];
                  if (movie.id == null) {
                    return SizedBox();
                  }
                  String month = '';
                  String date = '';
                  try {
                    final _date = DateTime.tryParse(movie.releaseDate!);
                    final formatedDate =
                        DateFormat.yMMMMd('en_US').format(_date!);
                    month = formatedDate
                        .split(' ')
                        .first
                        .substring(0, 3)
                        .toUpperCase();
                    date = movie.releaseDate!.split('-')[1];
                  } catch (_) {
                    month = '';
                    date = '';
                  }

                  return ComingSoonWidget(
                    month: month,
                    id: movie.id.toString(),
                    day: date,
                    movieName: movie.originalTitle ?? 'No title',
                    posterPath: '$imageAppendUrl${movie.backdropPath}',
                    description: movie.overview ?? 'No Description',
                  );
                });
          }
        },
      ),
    );
  }
}

class EveryoneIsWatching extends StatelessWidget {
  const EveryoneIsWatching({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(LoadDataInEveryoneIsWatching());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(LoadDataInEveryoneIsWatching());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isError) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.isLOading) {
            return Center(
              child: Text('Error while loading soon list'),
            );
          } else if (state.everyOneIsWatchingList.isEmpty) {
            return Center(
              child: Text('Everyone is watching list is empty'),
            );
          } else {
            return ListView.builder(
                itemCount: state.everyOneIsWatchingList.length,
                itemBuilder: (context, index) {
                  final movie = state.everyOneIsWatchingList[index];
                  if (movie.id == null) {
                    return SizedBox();
                  } else {
                    final tv = state.everyOneIsWatchingList[index];
                    return EveroneWactching(
                        posterPath: '$imageAppendUrl${movie.backdropPath}',
                        movieName: tv.originalTitle ?? 'No name provided',
                        description: tv.overview ?? 'No description');
                  }
                });
          }
        },
      ),
    );
  }
}
