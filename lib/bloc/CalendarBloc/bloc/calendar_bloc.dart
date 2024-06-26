import 'package:bloc/bloc.dart';
import 'package:food_preorder_app/dates.dart';
import 'package:food_preorder_app/utils/SameDayFunction.dart';
import 'package:meta/meta.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(CalendarInitial()) {
    DateTime now = DateTime.now();
    on<ChangeCalendar>((event, emit) {
      // TODO: implement event handler
      dates.clear();
      dates =List.from(dummydates);
      getFutureDates(dates);
      emit((CalendarChanged()));
    }
    
    
    
    );
    on<AddOrRemoveDate>((event,emit){
      final date = event.date;


      if (date.weekday != DateTime.sunday && date.isAfter(DateTime(now.year, now.month, now.day))) {
        if (dummydates.any((d) => isSameDay(d, date))) {
                      //dates.removeWhere((d) => isSameDay(d, selectedDay));
          dummydates.removeWhere((d) => isSameDay(d, date));
        } else {
          dummydates.add(date);
        }
      print("dates ===========================");
      print(dates);
      print("dummydates =================================");
      print(dummydates);



      emit((DynamicCalendarChanged()));



    }});

    on<NoChangeInDynamicCalendar>((event,emit){
      print("INVOKED CALCEL FUNCTION");
      print("dates $dates");
      print("previous dummy data $dummydates");
      dummydates.clear();
      dummydates = List.from(dates);
      
      print("dates $dates");
      print("new dummy data $dummydates");
      
    });
  }
}
