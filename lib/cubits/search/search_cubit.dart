import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:horizon_comfort/data/database_repository.dart';
import 'package:horizon_comfort/data/models/shoe_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final DatabaseRepository _databaseRepository;

  SearchCubit({required DatabaseRepository databaseRepository})
      : _databaseRepository = databaseRepository,
        super(SearchInitial());

  Future<void> searchChanged(String name) async {
    try {
      emit(SearchLoading());

      List<ShoeModel> shoes = [];

      shoes = await _databaseRepository.filterShoes(name: name);

      emit(SearchChanged(shoes: shoes));
    } catch (e) {
      print(e);
      emit(SearchError(message: e.toString()));
    }
  }
}
