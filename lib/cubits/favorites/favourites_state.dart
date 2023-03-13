part of 'favourites_cubit.dart';

@immutable
abstract class FavouritesState extends Equatable {}

class FavouritesInitial extends FavouritesState {
  @override
  List<Object> get props => [];
}

class FavouritesLoading extends FavouritesState {
  @override
  List<Object> get props => [];
}

class FavouritesError extends FavouritesState {
  final String message;

  FavouritesError({required this.message});

  @override
  List<Object> get props => [message];
}

class FavouritesChanged extends FavouritesState {
  final UserModel user;
  final List<ShoeModel> shoesFavourite;

  FavouritesChanged({required this.shoesFavourite, required this.user});

  @override
  List<Object> get props => [user, shoesFavourite];
}
