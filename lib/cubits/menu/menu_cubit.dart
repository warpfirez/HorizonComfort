import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:horizon_comfort/data/models/shoe_model.dart';
import 'package:meta/meta.dart';
import 'package:horizon_comfort/data/models/user_model.dart';
import 'package:horizon_comfort/data/database_repository.dart';

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
      emit(const MenuHome());
    } catch (e) {
      emit(MenuError(e.toString()));
    }
  }

  Future<void> getSearchScreen() async {
    try {
      emit(const MenuLoading());

      emit(const MenuSearch());
    } catch (e) {
      emit(MenuError(e.toString()));
    }
  }

  Future<void> getSettingsScreen() async {
    try {
      emit(const MenuLoading());
      final user = await _databaseRepository.fetchUser();
      emit(MenuSettings(user));
    } catch (e) {
      emit(MenuError(e.toString()));
    }
  }

  Future<void> getCartScreen() async {
    try {
      emit(const MenuLoading());

      emit(const MenuCart());
    } catch (e) {
      emit(MenuError(e.toString()));
    }
  }

  Future<void> getFavouritesScreen() async {
    try {
      emit(const MenuLoading());

      emit(const MenuFavourites());
    } catch (e) {
      emit(MenuError(e.toString()));
    }
  }
}
