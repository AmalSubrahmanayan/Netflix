part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required String  stateId,
    required List<HotAndNewData> pastYearMovieList,
      required List<HotAndNewData> trendingMovieList,
      required List<HotAndNewData> tensDramaMovieList,
      required List<HotAndNewData> southIndianMovieList,
      required List<HotAndNewData> trendingTvList,
      required bool isLoading,
      required bool hasError}) = _Initial;
  factory HomeState.initial() => HomeState(
      trendingMovieList: [],
      pastYearMovieList: [],
      tensDramaMovieList: [],
      southIndianMovieList: [],
      trendingTvList: [],
      isLoading: true,
      hasError: false,
     stateId: "0");
}
