import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:horizon_comfort/data/database_repository.dart';
import 'package:horizon_comfort/data/models/shoe_model.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final DatabaseRepository _databaseRepository;

  HomeCubit({required DatabaseRepository databaseRepository})
      : _databaseRepository = databaseRepository,
        super(HomeInitial());

  Future<void> loadData() async {
    try {
      emit(HomeLoading());

      final shoesArrivals = await _databaseRepository.fetchShoes();
      final shoesPopular = await _databaseRepository.fetchShoesByPopularity();

      Future.delayed(const Duration(milliseconds: 500), () {
        emit(HomeLoaded(
            shoesArrivals: shoesArrivals, shoesPopular: shoesPopular));
      });
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }
}
