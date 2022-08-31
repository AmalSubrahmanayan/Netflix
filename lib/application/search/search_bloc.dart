import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:neetflix/domain/core/downloads/i_downloads_repo.dart';
import 'package:neetflix/domain/core/downloads/models/downloads.dart';
import 'package:neetflix/domain/core/failures/main_failure.dart';
import 'package:neetflix/domain/search/model/search_respo/search_respo.dart';
import 'package:neetflix/domain/search/seacrch_service.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsService;
  final SearchService _searchService;
  SearchBloc(
    this._searchService,
    this._downloadsService,
  ) : super(SearchState.initial()) {
/*
idle state
*/
    on<Initialize>((event, emit) async {
      if (state.idleLIst.isNotEmpty) {
        emit(SearchState(
          searchResultList: [],
          idleLIst: state.idleLIst,
          isLoading: false,
          isError: false,
        ));
        return;
      }
      emit(const SearchState(
        searchResultList: [],
        idleLIst: [],
        isLoading: true,
        isError: false,
      ));
      // get trending
      // show to ui
      final _result = await _downloadsService.getDownloadsImages();
      final _state = _result.fold(
        (MainFailure f) {
          return const SearchState(
            searchResultList: [],
            idleLIst: [],
            isLoading: false,
            isError: true,
          );
        },
        (List<Downloads> list) {
          return SearchState(
            searchResultList: [],
            idleLIst: list,
            isLoading: false,
            isError: false,
          );
        },
      );
      emit(_state);
    });
/*
search result state
*/

    on<SearchMovie>((event, emit) async {
      // call search movie api
      emit(const SearchState(
        searchResultList: [],
        idleLIst: [],
        isLoading: true,
        isError: false,
      ));
      final _result =
          await _searchService.searchMovies(movieQuery: event.movieQuery);
      final _State = _result.fold(
        (MainFailure f) {
          return const SearchState(
            searchResultList: [],
            idleLIst: [],
            isLoading: false,
            isError: true,
          );
        },
        (SearchRespo r) {
          return SearchState(
            searchResultList: r.results,
            idleLIst: [],
            isLoading: false,
            isError: false,
          );
        },
      );
      // show to ui
      emit(_State);
    });
  }
}
