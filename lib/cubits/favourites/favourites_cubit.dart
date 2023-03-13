import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:horizon_comfort/data/database_repository.dart';
import 'package:horizon_comfort/data/models/shoe_model.dart';
import 'package:horizon_comfort/data/models/user_model.dart';
import 'package:meta/meta.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  final DatabaseRepository _databaseRepository;

  FavouritesCubit({required DatabaseRepository databaseRepository})
      : _databaseRepository = databaseRepository,
        super(FavouritesInitial());

  Future<void> loadData() async {
    try {
      emit(FavouritesLoading());

      UserModel user = await _databaseRepository.fetchUser();
      List<ShoeModel> shoesFavourite = [];

      for (String shoeId in user.favouritesIds) {
        shoesFavourite.add(await _databaseRepository.fetchShoeById(shoeId));
      }

      emit(FavouritesLoaded(shoesFavourite: shoesFavourite, user: user));
    } catch (e) {
      emit(FavouritesError(message: e.toString()));
    }
  }

  Future<void> favouritesChanged(String shoeId) async {
    try {
      await _databaseRepository.updateUserFavorite(shoeId: shoeId);
      UserModel user = await _databaseRepository.fetchUser();

      List<ShoeModel> shoesFavourite = [];

      for (String shoeId in user.favouritesIds) {
        shoesFavourite.add(await _databaseRepository.fetchShoeById(shoeId));
      }

      emit(FavouritesLoaded(shoesFavourite: shoesFavourite, user: user));
    } catch (e) {
      emit(FavouritesError(message: e.toString()));
    }
  }
}
