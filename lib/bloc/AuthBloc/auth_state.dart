part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class AuthFailed extends AuthState{
  String errorMessage;
  AuthFailed({required this.errorMessage});

}
final class NoPassword extends AuthState{
  String errorMessage;
  NoPassword({required this.errorMessage});

}

final class NoUserName extends AuthState{
  String errorMessage;
  NoUserName({required this.errorMessage});

}
final class AuthSuccessfull extends AuthState{
  String successMessage;
  AuthSuccessfull({required this.successMessage});
}
final class AuthLoading extends AuthState{
  
}
final class GettingUserInfo extends AuthState{

}
