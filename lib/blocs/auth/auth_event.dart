part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthUserChanged extends AuthEvent {
  final auth.User user;

  AuthUserChanged({
    required this.user,
  });

  List<Object> get props => [user];
}
