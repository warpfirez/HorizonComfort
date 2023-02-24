import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'shoe_event.dart';
part 'shoe_state.dart';

class ShoeBloc extends Bloc<ShoeEvent, ShoeState> {
  int index = 0;

  ShoeBloc() : super(ShoeStateInitial()) {
    on<IncrementIndex>((event, emit) {
      index += 1;
      emit(ShoeUpdateIndex(index: index));
    });

    on<DecrementIndex>((event, emit) {
      index -= 1;
      emit(ShoeUpdateIndex(index: index));
    });
  }
}
