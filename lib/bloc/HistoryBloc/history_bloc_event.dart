part of 'history_bloc_bloc.dart';

@immutable
sealed class HistoryBlocEvent {}

final class GetLogData extends HistoryBlocEvent {
  DateTime? selectedmonth;
  int selectedYear;
  GetLogData({required this.selectedmonth, required this.selectedYear});
}
