part of 'shoe_bloc.dart';

@immutable
abstract class ShoeState extends Equatable {
  const ShoeState();

  @override
  List<Object> get props => [];
}

class ShoeStateInitial extends ShoeState {}

class ShoeUpdateIndex extends ShoeState {
  final int index;
  const ShoeUpdateIndex({required this.index});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is ShoeUpdateIndex &&
          runtimeType == other.runtimeType &&
          index == other.index;

  @override
  int get hashCode => super.hashCode ^ index.hashCode;
}
