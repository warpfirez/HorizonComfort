import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:meta/meta.dart';

import '../../data/auth_repository.dart';
import '../../data/database_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;
  final DatabaseRepository _databaseRepository;

  LoginCubit(
      {required AuthRepository authRepository,
      required DatabaseRepository databaseRepository})
      : _authRepository = authRepository,
        _databaseRepository = databaseRepository,
        super(LoginState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(newEmail: value, newStatus: LoginStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(newPassword: value, newStatus: LoginStatus.initial));
  }

  void loginWithCredentials() async {
    if (state.isValid == false) {
      return;
    }
    try {
      await _authRepository.signIn(
          email: state.email, password: state.password);

      await _databaseRepository.addUser(
        email: state.email,
        // favouritesIds: [],
        // cartIds: [],
      );

      emit(state.copyWith(newStatus: LoginStatus.success));
    } catch (e) {
      print(e);
    }
  }
}
