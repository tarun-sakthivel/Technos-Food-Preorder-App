part of 'calendar_bloc.dart';

@immutable
sealed class CalendarEvent {}

final class ChangeCalendar extends CalendarEvent{}
final class AddOrRemoveDate extends CalendarEvent{
  DateTime date;
  
  AddOrRemoveDate({required this.date});
}
final class NoChangeInDynamicCalendar extends CalendarEvent{}