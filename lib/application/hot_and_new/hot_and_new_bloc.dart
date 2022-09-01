import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:neetflix/domain/core/failures/main_failure.dart';
import 'package:neetflix/domain/hot_and_new/model/hot_and_new_resp.dart';
import 'package:neetflix/domain/hot_and_new/model/hot_and_new_service.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewService _hotAndNewService;
  HotAndNewBloc(this._hotAndNewService) : super(HotAndNewState.initial()) {
    //get hot and new movie data

    on<LoadDataInComingSoon>((event, emit) async {
      //send loading to ui

      emit(HotAndNewState(
          comingSoonList: [],
          everyOneIsWatchingList: [],
          isLOading: true,
          isError: false));

      final _reslut = await _hotAndNewService.getHotAndNewMoiveData();
      // data to state

      final newState = _reslut.fold((MainFailure failure) {
        return HotAndNewState(
          comingSoonList: [],
          everyOneIsWatchingList: [],
          isLOading: false,
          isError: true,
        );
      }, (HotAndNewResp resp) {
        return HotAndNewState(
          comingSoonList: resp.results,
          everyOneIsWatchingList: [],
          isLOading: false,
          isError: false,
        );
      });
      emit(newState);
    });

    //get hot and new tv data

    on<LoadDataInEveryoneIsWatching>((event, emit) async {
      //send loading to ui

      emit(HotAndNewState(
          comingSoonList: [],
          everyOneIsWatchingList: [],
          isLOading: true,
          isError: false));

      final _reslut = await _hotAndNewService.getHotAndNewTvData();
      // data to state

      final newState = _reslut.fold((MainFailure failure) {
        return HotAndNewState(
          comingSoonList: [],
          everyOneIsWatchingList: [],
          isLOading: false,
          isError: true,
        );
      }, (HotAndNewResp resp) {
        return HotAndNewState(
          comingSoonList: state.everyOneIsWatchingList,
          everyOneIsWatchingList: resp.results,
          isLOading: false,
          isError: false,
        );
      });
      emit(newState);
    });
  }
}
