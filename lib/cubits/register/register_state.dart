part of 'register_cubit.dart';

enum RegisterStatus { initial, submitting, success, error }

@immutable
class RegisterState {
  final String email;
  final String password;
  final String passwordConfirm;
  final String fullName;
  final String phone;
  final RegisterStatus status;

  const RegisterState({
    required this.email,
    required this.password,
    required this.passwordConfirm,
    required this.fullName,
    required this.phone,
    required this.status,
  });

  /// factory constructor
  factory RegisterState.initial() {
    return const RegisterState(
      email: '',
      password: '',
      passwordConfirm: '',
      fullName: '',
      phone: '',
      status: RegisterStatus.initial,
    );
  }

  /// Setter
  RegisterState copyWith({
    String? newEmail,
    String? newPassword,
    String? newPasswordConfirm,
    String? newFullName,
    String? newPhone,
    RegisterStatus? newStatus,
  }) {
    /// when this method gets called it returns a new RegisterState with
    /// new modified email/password/status
    /// doesn't necessarily need to change them
    return RegisterState(
      // if newEmail is null email is set to email
      // if newEmail isn't null email is set to newEmail
      email: newEmail ?? email,
      password: newPassword ?? password,
      passwordConfirm: newPasswordConfirm ?? passwordConfirm,
      fullName: newFullName ?? fullName,
      phone: newPhone ?? phone,
      status: newStatus ?? status,
    );
  }

  bool get isValid => (email.isNotEmpty && password.isNotEmpty);

  List<Object> get props => [email, password, status];
}
