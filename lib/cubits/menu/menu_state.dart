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
  const MenuHome();

  @override
  List<Object?> get props => [];
}

class MenuSearch extends MenuState {
  const MenuSearch();

  @override
  List<Object> get props => [];
}

class MenuFavourites extends MenuState {
  const MenuFavourites();

  @override
  List<Object> get props => [];
}

class MenuSettings extends MenuState {
  final UserModel user;

  const MenuSettings(this.user);

  @override
  List<Object?> get props => [user];
}

class MenuCart extends MenuState {
  const MenuCart();

  @override
  List<Object> get props => [];
}

class MenuError extends MenuState {
  final String message;

  const MenuError(this.message);

  @override
  List<Object?> get props => [message];
}
