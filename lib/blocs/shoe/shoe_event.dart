part of 'shoe_bloc.dart';

@immutable
abstract class ShoeEvent {}

class IncrementIndex extends ShoeEvent {}

class DecrementIndex extends ShoeEvent {}
