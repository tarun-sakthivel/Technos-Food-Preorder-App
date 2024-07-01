import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_log_event.dart';
part 'user_log_state.dart';

class UserLogBloc extends Bloc<UserLogEvent, UserLogState> {
  UserLogBloc() : super(UserLogInitial()) {
    on<navigateuserlog>((event, emit) {
      emit(backbutton());
    });
    on<UserLogEvent>((event, emit) {
      emit(UserLogLoading());
      //The api calls will be written here
      emit(UserLogSuccess(successmessage: "You have successfully navigated"));
      // TODO: implement event handler
    });
  }
}
