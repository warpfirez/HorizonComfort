import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'shoe_event.dart';
part 'shoe_state.dart';

class ShoeBloc extends Bloc<ShoeEvent, ShoeState> {
  int galleryIndex = 0;

  ShoeBloc() : super(ShoeStateInitial()) {
    on<IncrementIndex>((event, emit) {
      if (galleryIndex < 4) {
        galleryIndex += 1;
      } else {
        galleryIndex = 0;
      }

      emit(ShoeUpdateIndex(galleryIndex: galleryIndex));
    });

    on<DecrementIndex>((event, emit) {
      if (galleryIndex > 1) {
        galleryIndex -= 1;
      } else {
        galleryIndex = 4;
      }
      emit(ShoeUpdateIndex(galleryIndex: galleryIndex));
    });
  }
}
