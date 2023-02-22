import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:horizon_comfort/data/models/shoe_model.dart';
import 'package:meta/meta.dart';

import '../../data/home_repository.dart';
import '../../data/models/user_model.dart';
import '../../data/search_repository.dart';
import 'package:horizon_comfort/utilities/network.dart';

import '../../data/database_repository.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  final HomeRepository _homeRepository;
  final SearchRepository _searchRepository;
  final DatabaseRepository _databaseRepository;

  MenuCubit({
    required HomeRepository homeRepository,
    required SearchRepository searchRepository,
    required DatabaseRepository settingsRepository,
  })  : _homeRepository = homeRepository,
        _searchRepository = searchRepository,
        _databaseRepository = settingsRepository,
        super(const MenuInitial());

  Future<void> getHomeScreen() async {
    try {
      emit(const MenuLoading());
      final shoes = await _databaseRepository.fetchShoes();
      emit(MenuHome(shoes));
    } on NetworkException {
      emit(const MenuError("Network exception Home Page"));
    }
  }

  Future<void> getSearchScreen(String searchTestData) async {
    try {
      emit(const MenuLoading());
      final data = await _searchRepository.fetchData(searchTestData);
      emit(MenuSearch(data));
    } on NetworkException {
      emit(const MenuError("Network exception Search Page"));
    }
  }

  Future<void> getSettingsScreen() async {
    try {
      emit(const MenuLoading());
      final user = await _databaseRepository.fetchUser();
      emit(MenuSettings(user));
    } on NetworkException {
      emit(const MenuError("Network exception Search Page"));
    }
  }
}
