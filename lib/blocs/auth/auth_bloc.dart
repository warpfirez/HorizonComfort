import 'dart:async';

import 'package:bloc/bloc.dart';
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
    _userSubscription = _authRepository.user
        .listen((user) => add(AuthUserChanged(user: user!)));
  }

  Stream<AuthState> mapEventToState(
    AuthState event,
  ) async* {
    if (event is AuthUserChanged) {
      try {
        yield AuthState.userAuthenticated(user: event.user!);
        _userSubscription?.cancel();
        super.close();
      } catch (e) {
        print(e);
      }
    }
  }
}
