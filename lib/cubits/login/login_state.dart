part of 'login_cubit.dart';

enum LoginStatus { initial, submitting, success, error }

@immutable
class LoginState {
  final String email;
  final String password;
  final LoginStatus status;
  final auth.User? user;

  const LoginState({
    required this.email,
    required this.password,
    required this.status,
    this.user,
  });

  factory LoginState.initial() {
    return const LoginState(
      email: '',
      password: '',
      status: LoginStatus.initial,
      user: null,
    );
  }

  ///setter
  LoginState copyWith({
    String? newEmail,
    String? newPassword,
    LoginStatus? newStatus,
    auth.User? newUser,
  }) {
    return LoginState(
      email: newEmail ?? email,
      password: newPassword ?? password,
      status: newStatus ?? status,
      user: newUser ?? user,
    );
  }

  bool get isValid => (password.isNotEmpty && email.isNotEmpty);

  List<Object> get props => [email, password, status];
}
