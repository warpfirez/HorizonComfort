part of 'auth_bloc.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthState extends Equatable {
  final AuthStatus status;
  final auth.User? user;

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
}
