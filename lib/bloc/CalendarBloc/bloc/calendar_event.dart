part of 'calendar_bloc.dart';

@immutable
sealed class CalendarEvent {}

final class ChangeCalendar extends CalendarEvent{}
