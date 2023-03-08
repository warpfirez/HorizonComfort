import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:horizon_comfort/data/models/shoe_model.dart';
import 'package:meta/meta.dart';

import '../../data/models/user_model.dart';
import '../../data/search_repository.dart';
import 'package:horizon_comfort/utilities/network.dart';

import '../../data/database_repository.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  final SearchRepository _searchRepository;
  final DatabaseRepository _databaseRepository;

  MenuCubit({
    required SearchRepository searchRepository,
    required DatabaseRepository settingsRepository,
  })  : _searchRepository = searchRepository,
        _databaseRepository = settingsRepository,
        super(const MenuInitial());

  // Future<void> menuInitial() async {
  //   emit(const MenuLoading());
  //   final shoes = await _databaseRepository.fetchShoes();
  //   emit(MenuHome(shoes));
  // }

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
      final user = await _databaseRepository
          .fetchUser(FirebaseAuth.instance.currentUser?.uid);
      emit(MenuSettings(user));
    } on NetworkException {
      emit(const MenuError("Network exception Search Page"));
    }
  }

  Future<void> getCartScreen() async {
    try {
      emit(const MenuLoading());

      final user = await _databaseRepository
          .fetchUser(FirebaseAuth.instance.currentUser?.uid);
      List<ShoeModel> shoesInCart = [];
      int totalPrice = 0;

      for (String shoeId in user.cartIds) {
        shoesInCart.add(await _databaseRepository.fetchShoeById(shoeId));
      }

      for (var id = 0; id < shoesInCart.length; id++) {
        totalPrice += shoesInCart[id].price!.toInt();
      }

      emit(MenuCart(user, shoesInCart, totalPrice));
    } on NetworkException {
      emit(const MenuError("Network exception Search Page"));
    }
  }

  Future<void> removeCartItem(String shoeId) async {
    try {
      emit(const MenuLoading());

      List<ShoeModel> shoesInCart = [];
      int totalPrice = 0;

      await _databaseRepository.removeCartItem(shoeId);

      print("deleted $shoeId");

      var user = await _databaseRepository
          .fetchUser(FirebaseAuth.instance.currentUser?.uid);

      for (String shoeId in user.cartIds) {
        shoesInCart.add(await _databaseRepository.fetchShoeById(shoeId));
      }

      for (var id = 0; id < shoesInCart.length; id++) {
        totalPrice += shoesInCart[id].price!.toInt();
      }

      emit(MenuCart(user, shoesInCart, totalPrice));
    } on NetworkException {
      emit(const MenuError("Network exception Search Page"));
    }
  }
}
