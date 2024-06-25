part of 'history_bloc_bloc.dart';

@immutable
sealed class HistoryBlocState {}

final class HistoryBlocInitial extends HistoryBlocState {}

final class dataSuccessfull extends HistoryBlocState {
  String successMessage;
  DateTime? selectedmonth;
  dataSuccessfull({required this.successMessage, required this.selectedmonth});
}

final class dataFailed extends HistoryBlocState {
  String errorMessage;
  dataFailed({required this.errorMessage});
}

final class dataLoading extends HistoryBlocState {}
