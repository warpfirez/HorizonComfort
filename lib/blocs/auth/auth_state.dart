part of 'auth_bloc.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthState {
  final AuthStatus status;
  final auth.User? user;

  const AuthState(this.status, this.user);

  const AuthState.defaultConstructor({
    this.status = AuthStatus.unknown,
    this.user,
  });

  const AuthState.userUnknown()
      : this.defaultConstructor(
          status: AuthStatus.unknown,
        );

  const AuthState.userAuthenticated({required auth.User user})
      : this.defaultConstructor(
          status: AuthStatus.authenticated,
          user: user,
        );

  const AuthState.userUnauthenticated()
      : this.defaultConstructor(
          status: AuthStatus.unauthenticated,
        );

  List<Object?> get props => [
        status,
        user,
      ];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthState &&
          runtimeType == other.runtimeType &&
          user == other.user;

  @override
  int get hashCode => user.hashCode;
}
