part of 'calendar_bloc.dart';

@immutable
sealed class CalendarEvent {}

final class ChangeCalendar extends CalendarEvent {
  late BuildContext context;
  ChangeCalendar({required this.context});
}

final class AddOrRemoveDate extends CalendarEvent {
  DateTime date;

  AddOrRemoveDate({required this.date});
}

final class NoChangeInDynamicCalendar extends CalendarEvent {
  late BuildContext context;
  NoChangeInDynamicCalendar({required this.context});
}

final class AddOrdersToDatabase extends CalendarEvent {
  late BuildContext context;
  AddOrdersToDatabase({required this.context});
}

final class ShowDynamicCalendar extends CalendarEvent {}
