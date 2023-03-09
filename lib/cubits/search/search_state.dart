part of 'search_cubit.dart';

@immutable
abstract class SearchState extends Equatable {}

class SearchInitial extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoading extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchError extends SearchState {
  final String message;

  SearchError({required this.message});

  @override
  List<Object> get props => [];
}

class SearchChanged extends SearchState {
  final List<ShoeModel> shoes;

  SearchChanged({required this.shoes});

  @override
  List<Object> get props => [];
}
