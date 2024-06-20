import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {

    
    on<AuthenticateUser>((event, emit)async {
      
      

      //TODO : add the api function call here for authentication
      //For Developing we have added the time delay for the loading feature
      if (event.userName.isEmpty || event.password.isEmpty){
        emit(AuthFailed(errorMessage: "Please fill UserName or Password"));
      }else if ( event.userName.length >15 ){
        emit(AuthFailed(errorMessage: "UserName should be at less than 6 characters"));
      }else {
        emit(AuthLoading());
        await Future.delayed(const Duration(seconds:2));
        emit(AuthSuccessfull(successMessage: "You have Logged in Successfully!!"));
      }
      
      

      
    });
  }
}
