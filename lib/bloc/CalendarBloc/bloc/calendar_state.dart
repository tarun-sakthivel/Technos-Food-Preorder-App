part of 'calendar_bloc.dart';

@immutable
sealed class CalendarState {}

final class CalendarInitial extends CalendarState {}
final class CalendarChanged extends CalendarState{}
final class DynamicCalendarChanged extends CalendarState{}
final class AddingToDatabase extends CalendarState{
 
}
final class AddingToDatabaseFailed extends CalendarState{
  String errorMessage;
  AddingToDatabaseFailed(this.errorMessage);
}

final class ShowingDynamicCalendar extends CalendarState{
  
}