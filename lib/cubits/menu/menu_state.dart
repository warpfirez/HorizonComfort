part of 'menu_cubit.dart';

@immutable
abstract class MenuState extends Equatable {
  const MenuState();
}

class MenuInitial extends MenuState {
  const MenuInitial();

  @override
  List<Object?> get props => [];
}

class MenuLoading extends MenuState {
  const MenuLoading();

  @override
  List<Object?> get props => [];
}

class MenuHome extends MenuState {
  final List<ShoeModel> shoes;

  const MenuHome(this.shoes);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenuHome &&
          runtimeType == other.runtimeType &&
          shoes == other.shoes;

  @override
  int get hashCode => shoes.hashCode;

  @override
  List<Object?> get props => [shoes];
}

class MenuSearch extends MenuState {
  final List<ShoeModel> shoesFiltered;

  MenuSearch({List<ShoeModel>? shoesFiltered})
      : shoesFiltered = shoesFiltered ?? [];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenuSearch &&
          runtimeType == other.runtimeType &&
          shoesFiltered == other.shoesFiltered;

  @override
  int get hashCode => shoesFiltered.hashCode;

  @override
  List<Object?> get props => [shoesFiltered];
}

class MenuSettings extends MenuState {
  final UserModel user;

  const MenuSettings(this.user);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenuSettings &&
          runtimeType == other.runtimeType &&
          user == other.user;

  @override
  int get hashCode => user.hashCode;

  @override
  List<Object?> get props => [user];
}

class MenuCart extends MenuState {
  final UserModel user;
  final List<ShoeModel> shoesInCart;
  final int totalPrice;

  const MenuCart(this.user, this.shoesInCart, this.totalPrice);

  @override
  List<Object?> get props => [user, shoesInCart, totalPrice];
}

class MenuError extends MenuState {
  final String message;
  const MenuError(this.message);

  @override
  List<Object?> get props => [message];
}
