import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:food_preorder_app/API/API_methods.dart';
import 'package:food_preorder_app/API/APIinfos.dart';
import 'package:food_preorder_app/UserModel.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthenticateUser>((event, emit) async {
      if (event.userName.isEmpty) {
        emit(AuthFailed(errorMessage: "Please fill UserName"));
      } else if (event.password.isEmpty) {
        emit(AuthFailed(errorMessage: "Pleas fill Your Password"));
      } else if (event.userName.length > 15) {
        emit(AuthFailed(
            errorMessage: "UserName should be at less than 15 characters"));
      } else {
        emit(AuthLoading());

        //LOGIN API call
        try {
          final url = Uri.parse(
              'http://lunchapi-001-site1.etempurl.com/api/User/Login?username=${event.userName}&password=${event.password}');
          final headers = {
            'Content-Type': 'application/json',
            'Authorization': 'Basic ' +
                base64Encode(utf8.encode('${Authusername}:${Authpassword}'))
          };

          final response = await http.post(url, headers: headers);

          if (response.statusCode == 200) {
            print(response.statusCode);
            Map<String, dynamic> fulldata = jsonDecode(response.body);
            Map<String, dynamic> data = fulldata['data'];
            emit((GettingUserInfo()));
            Add_data(data);
            //gets the no of orders from the API call method
            Orders_completed = await Get_orders_completed(Id);
            await Get_Pre_Orders(Id);
            emit(AuthSuccessfull(
                successMessage: "You have Logged in Successfully!!"));
          } else {
            print('Login failed: ${response.reasonPhrase}');
            emit(AuthFailed(errorMessage: "${response.reasonPhrase}"));
          }
        } catch (e) {
          print("error in api");
          emit(AuthFailed(errorMessage: "${e.toString()}"));
        }
      }
    });
  }
}
