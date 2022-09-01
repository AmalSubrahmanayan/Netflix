part of 'hot_and_new_bloc.dart';

@freezed
class HotAndNewState with _$HotAndNewState {
  const factory HotAndNewState({
    required List<HotAndNewData> comingSoonList,
    required List<HotAndNewData> everyOneIsWatchingList,
    required bool isLOading,
    required bool isError,
  }) = _Initial;

  factory HotAndNewState.initial() => HotAndNewState(
      comingSoonList: [],
      everyOneIsWatchingList: [],
      isLOading: false,
      isError: false);
}
