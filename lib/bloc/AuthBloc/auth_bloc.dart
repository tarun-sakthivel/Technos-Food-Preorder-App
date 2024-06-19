import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {

    
    on<AuthenticateUser>((event, emit)async {
      
      emit(AuthLoading());

      //TODO : add the api function call here for authentication
      //For Developing we have added the time delay for the loading feature
      print("delaying");
      await Future.delayed(const Duration(seconds:3));
      print("delayed");

      emit(
          AuthSuccessfull(successMessage: "You have Logged in Successfully!!"));
    });
  }
}
