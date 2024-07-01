part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthenticateUser extends AuthEvent {
  String userName;
  String password;
  AuthenticateUser({required this.userName, required this.password});
}
