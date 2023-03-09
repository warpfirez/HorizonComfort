import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:horizon_comfort/data/auth_repository.dart';
import 'package:horizon_comfort/data/database_repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _authRepository;
  final DatabaseRepository _databaseRepository;

  RegisterCubit({
    required AuthRepository authRepository,
    required DatabaseRepository databaseRepository,
  })  : _authRepository = authRepository,
        _databaseRepository = databaseRepository,
        super(RegisterState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(newEmail: value, newStatus: RegisterStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(newPassword: value, newStatus: RegisterStatus.initial));
  }

  void passwordConfirmChanged(String value) {
    emit(state.copyWith(
        newPasswordConfirm: value, newStatus: RegisterStatus.initial));
  }

  void fullNameChanged(String value) {
    emit(state.copyWith(newFullName: value, newStatus: RegisterStatus.initial));
  }

  void phoneChanged(String value) {
    emit(state.copyWith(newPhone: value, newStatus: RegisterStatus.initial));
  }

  Future<void> registerWithCredentials() async {
    if (state.isValid == false) {
      return;
    }
    try {
      await _authRepository.signUp(
        email: state.email,
        password: state.password,
      );

      await _authRepository.signIn(
        email: state.email,
        password: state.password,
      );

      await _databaseRepository.addUser(
        email: state.email,
        fullName: state.fullName,
        phoneNumber: state.phone,
        favouritesIds: [],
        cartIds: [],
      );

      emit(state.copyWith(newStatus: RegisterStatus.success));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    }
  }
}
