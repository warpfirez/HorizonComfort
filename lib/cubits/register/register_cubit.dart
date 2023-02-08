import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/auth_repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _authRepository;

  RegisterCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(RegisterState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(newEmail: value, newStatus: RegisterStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(newPassword: value, newStatus: RegisterStatus.initial));
  }

  void registerWithCredentials() async {
    if (state.isValid == false) {
      return;
    }
    try {
      await _authRepository.register(
        email: state.email,
        password: state.password,
      );

      emit(state.copyWith(newStatus: RegisterStatus.success));
    } catch (e) {
      print(e);
    }
  }
}
