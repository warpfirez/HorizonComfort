import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/home_repository.dart';
import '../../data/search_repository.dart';
import 'package:horizon_comfort/utilities/network.dart';

part 'pages_state.dart';

class MenuCubit extends Cubit<PagesState> {
  final HomeRepository _homeRepository;
  final SearchRepository _searchRepository;
  MenuCubit({
    required HomeRepository homeRepository,
    required SearchRepository searchRepository,
  })  : _homeRepository = homeRepository,
        _searchRepository = searchRepository,
        super(const PagesInitial());

  Future<void> getHomePage(String homeTestData) async {
    try {
      emit(const PagesLoading());
      final data = await _homeRepository.fetchData(homeTestData);
      emit(PagesHome(homeTestData));
    } on NetworkException {
      emit(const PagesError("Network exception Home Page"));
    }
  }

  Future<void> getSearchPage(String searchTestData) async {
    try {
      emit(const PagesLoading());
      final data = await _searchRepository.fetchData(searchTestData);
      emit(PagesSearch(data));
    } on NetworkException {
      emit(const PagesError("Network exception Search Page"));
    }
  }
}
