import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:horizon_comfort/data/models/shoe_model.dart';
import 'package:meta/meta.dart';
import 'package:horizon_comfort/data/models/user_model.dart';
import 'package:horizon_comfort/utilities/network.dart';

import '../../data/database_repository.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  final DatabaseRepository _databaseRepository;

  MenuCubit({
    required DatabaseRepository settingsRepository,
  })  : _databaseRepository = settingsRepository,
        super(const MenuInitial());

  Future<void> getHomeScreen() async {
    try {
      emit(const MenuLoading());
      //TODO fetch best price/ another filter
      final shoes = await _databaseRepository.fetchShoes();
      emit(MenuHome(shoes));
    } on NetworkException {
      emit(const MenuError("Network exception Home Page"));
    }
  }

  Future<void> getSearchScreen() async {
    try {
      emit(const MenuLoading());

      emit(const MenuSearch());
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

  Future<void> getCartScreen() async {
    try {
      emit(const MenuLoading());

      emit(const MenuCart());
    } on NetworkException {
      emit(const MenuError("Network exception Search Page"));
    }
  }

  Future<void> getFavouritesScreen() async {
    try {
      emit(const MenuLoading());

      emit(const MenuFavourites());
    } on NetworkException {
      emit(const MenuError("Network exception Search Page"));
    }
  }
}
