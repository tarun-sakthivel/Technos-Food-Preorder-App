part of 'history_bloc_bloc.dart';

@immutable
sealed class HistoryBlocEvent {}

final class GetLogData extends HistoryBlocEvent {
  DateTime? selectedmonth;
  GetLogData({required this.selectedmonth});
}
