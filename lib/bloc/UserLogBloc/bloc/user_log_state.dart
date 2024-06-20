part of 'user_log_bloc.dart';

@immutable
sealed class UserLogState {}

final class UserLogInitial extends UserLogState {}

final class UserLogLoading extends UserLogState {}

final class UserLogFailed extends UserLogState {}

final class UserLogSuccess extends UserLogState {
  String successmessage;
  UserLogSuccess({required this.successmessage});
}
