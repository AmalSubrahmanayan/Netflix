// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:neetflix/domain/core/failures/main_failure.dart';
import 'package:neetflix/domain/hot_and_new/model/hot_and_new_resp.dart';
import 'package:neetflix/domain/hot_and_new/model/hot_and_new_service.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewService _homeService;
  HomeBloc(this._homeService) : super(HomeState.initial()) {
    // on event get home screen data
    on<GetHomeScreenData>((event, emit) async {
      //send loading to ui
      emit(state.copyWith(isLoading: true, hasError: false));
      // get data
      final _movieResult = await _homeService.getHotAndNewMoiveData();
      final _tvResult = await _homeService.getHotAndNewTvData();

      //transform data
      final _state1 = _movieResult.fold((MainFailure failure) {
        return HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: [],
            trendingMovieList: [],
            tensDramaMovieList: [],
            southIndianMovieList: [],
            trendingTvList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewResp resp) {
        final pastYear = resp.results;
        final trendingMovie = resp.results;
        final tensDramaMovie = resp.results;
        final southIndianMovie = resp.results;

        pastYear.shuffle();
        trendingMovie.shuffle();
        tensDramaMovie.shuffle();
        southIndianMovie.shuffle();
        return HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: pastYear,
            trendingMovieList: trendingMovie,
            tensDramaMovieList: tensDramaMovie,
            southIndianMovieList: southIndianMovie,
            trendingTvList: state.trendingTvList,
            isLoading: false,
            hasError: false);
      });

      emit(_state1);

      final _state2 = _tvResult.fold((MainFailure failure) {
        return HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: [],
            trendingMovieList: [],
            tensDramaMovieList: [],
            southIndianMovieList: [],
            trendingTvList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewResp resp) {
        final to10List = resp.results;
        return HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: state.pastYearMovieList,
            trendingMovieList: state.trendingMovieList,
            tensDramaMovieList: state.tensDramaMovieList,
            southIndianMovieList: state.southIndianMovieList,
            trendingTvList: to10List,
            isLoading: false,
            hasError: false);
      });

      //send to ui

      emit(_state2);
    });
  }
}
