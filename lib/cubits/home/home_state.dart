part of 'home_cubit.dart';

@immutable
abstract class HomeState extends Equatable {}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeError extends HomeState {
  final String message;

  HomeError({
    required this.message,
  });

  @override
  List<Object> get props => [];
}

class HomeLoaded extends HomeState {
  final List<ShoeModel> shoesArrivals;
  final List<ShoeModel> shoesPopular;

  HomeLoaded({
    required this.shoesArrivals,
    required this.shoesPopular,
  });

  @override
  List<Object> get props => [shoesArrivals, shoesPopular];
}
