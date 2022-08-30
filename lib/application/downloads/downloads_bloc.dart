import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
// import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neetflix/domain/core/downloads/i_downloads_repo.dart';
import 'package:neetflix/domain/core/downloads/models/downloads.dart';
import 'package:neetflix/domain/core/failures/main_failure.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';

part 'downloads_bloc.freezed.dart';

class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadsRepo _downloadsRepo;
  DownloadsBloc(this._downloadsRepo) : super(DownloadsState.inital()) {
    on<_GetDownloadsImages>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          downloadsFailuerOrSuccessOption: none(),
        ),
      );
      final Either<MainFailure, List<Downloads>> downloadsOption =
          await _downloadsRepo.getDownloadsImages();
      emit(
        downloadsOption.fold(
          (failure) => state.copyWith(
              isLoading: false,
              downloadsFailuerOrSuccessOption: Some(Left(failure))),
          (success) => state.copyWith(
              isLoading: false,
              downloads: success,
              downloadsFailuerOrSuccessOption: Some(Right(success))),
        ),
      );
    });
  }
}
