import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:horizon_comfort/data/database_repository.dart';
import 'package:horizon_comfort/data/models/shoe_model.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final DatabaseRepository _databaseRepository;

  CartCubit({required DatabaseRepository databaseRepository})
      : _databaseRepository = databaseRepository,
        super(CartInitial());

  Future<void> loadData() async {
    try {
      emit(CartLoading());

      final user = await _databaseRepository.fetchUser();
      List<ShoeModel> shoesInCart = [];
      int totalPrice = 0;

      for (String shoeId in user.cartIds) {
        shoesInCart.add(await _databaseRepository.fetchShoeById(shoeId));
      }

      for (var id = 0; id < shoesInCart.length; id++) {
        totalPrice += shoesInCart[id].price!.toInt();
      }

      emit(CartLoaded(shoesInCart: shoesInCart, totalPrice: totalPrice));
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }

  Future<void> removeCartItem(String shoeId) async {
    try {
      List<ShoeModel> shoesInCart = [];
      int totalPrice = 0;

      await _databaseRepository.removeCartItem(shoeId);

      print("deleted $shoeId");

      var user = await _databaseRepository.fetchUser();

      for (String shoeId in user.cartIds) {
        shoesInCart.add(await _databaseRepository.fetchShoeById(shoeId));
      }

      for (var id = 0; id < shoesInCart.length; id++) {
        totalPrice += shoesInCart[id].price!.toInt();
      }

      emit(CartLoaded(shoesInCart: shoesInCart, totalPrice: totalPrice));
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }
}
