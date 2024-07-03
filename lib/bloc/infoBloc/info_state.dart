part of 'info_bloc.dart';

@immutable
sealed class InfoState {}

final class InfoInitial extends InfoState {}
final class ShowingInfo extends InfoState{}

