import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:meta/meta.dart';

import '../../data/auth_repository.dart';
import '../../data/database_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
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

      emit(state.copyWith(newStatus: LoginStatus.success));
    } catch (e) {
      print(e);
    }
  }
}
