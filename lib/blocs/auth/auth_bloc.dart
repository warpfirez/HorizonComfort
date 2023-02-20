import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../data/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  StreamSubscription<auth.User?>? _userSubscription;

  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const AuthState.userUnknown()) {
    on<AuthUserChanged>(_onAuthUserChanged);
    _userSubscription = _authRepository.user.listen(
      (user) => add(
        AuthUserChanged(user: user),
      ),
    );

    on<SignOut>((event, emit) async {
      try {
        await authRepository.signOut();
      } on FirebaseAuthException catch (e) {
        print(e);
      }

      emit(const AuthState.userUnauthenticated());
    });
  }

  void _onAuthUserChanged(
    AuthUserChanged event,
    Emitter<AuthState> emit,
  ) {
    event.user != null
        ? emit(AuthState.userAuthenticated(user: event.user!))
        : emit(const AuthState.userUnauthenticated());
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
