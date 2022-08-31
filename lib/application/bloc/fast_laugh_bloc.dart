import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:neetflix/domain/core/downloads/i_downloads_repo.dart';

import '../../domain/core/downloads/models/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final dummyVideoUrl = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4"
];

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(
    IDownloadsRepo _downloadService,
  ) : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      // sending loading to ui
      emit(const FastLaughState(
        videoList: [],
        isLOading: true,
        isError: false,
      ));
      // get trending movies
      final _result = await _downloadService.getDownloadsImages();
      final _state = _result.fold((l) {
        return FastLaughState(
          videoList: [],
          isLOading: false,
          isError: true,
        );
      },
          (resp) => FastLaughState(
                videoList: resp,
                isLOading: false,
                isError: false,
              ));

      // send to ui
      emit(_state);
    });
  }
}
