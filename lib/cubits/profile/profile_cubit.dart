import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/auth_repository.dart';
import '../../data/database_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final AuthRepository _authRepository;
  final DatabaseRepository _databaseRepository;

  ProfileCubit({
    required AuthRepository authRepository,
    required DatabaseRepository databaseRepository,
  })  : _authRepository = authRepository,
        _databaseRepository = databaseRepository,
        super(ProfileState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(newEmail: value, newStatus: ProfileStatus.initial));
  }

  void fullNameChanged(String value) {
    emit(state.copyWith(newFullName: value, newStatus: ProfileStatus.initial));
  }

  void phoneChanged(String value) {
    emit(state.copyWith(newPhone: value, newStatus: ProfileStatus.initial));
  }

  Future<void> editProfileDetails() async {
    try {
      if (state.isValid == false) {
        return;
      }

      await _databaseRepository.updateUser(
        newEmail: state.email,
        newFullName: state.fullName,
        newPhone: state.phone,
      );

      emit(state.copyWith(newStatus: ProfileStatus.success));
    } catch (e) {
      print(e);
      emit(state.copyWith(newStatus: ProfileStatus.error));
    }
  }
}
