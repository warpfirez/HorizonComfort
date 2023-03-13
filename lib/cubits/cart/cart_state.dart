part of 'cart_cubit.dart';

@immutable
abstract class CartState extends Equatable {}

class CartInitial extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoading extends CartState {
  @override
  List<Object> get props => [];
}

class CartError extends CartState {
  final String message;

  CartError({required this.message});

  @override
  List<Object> get props => [message];
}

class CartLoaded extends CartState {
  final List<ShoeModel> shoesInCart;
  final int totalPrice;

  CartLoaded({
    required this.shoesInCart,
    required this.totalPrice,
  });

  @override
  List<Object> get props => [shoesInCart, totalPrice];
}
