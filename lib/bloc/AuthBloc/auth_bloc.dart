import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:food_preorder_app/API/APIinfos.dart';
import 'package:food_preorder_app/UserModel.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthenticateUser>((event, emit) async {
      //TODO : add the api function call here for authentication
      //For Developing we have added the time delay for the loading feature
      if (event.userName.isEmpty) {
        emit(AuthFailed(errorMessage: "Please fill UserName"));
      } else if (event.password.isEmpty) {
        emit(AuthFailed(errorMessage: "Pleas fill Your Password"));
      } else if (event.userName.length > 15) {
        emit(AuthFailed(
            errorMessage: "UserName should be at less than 15 characters"));
      } else {
        emit(AuthLoading());

        //await Future.delayed(const Duration(seconds: 2));
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
            Map<String, dynamic> fulldata = jsonDecode(response.body);
            Map<String, dynamic> data = fulldata['data'];
            Add_data(data);
            //Orders_completed = (await Get_orders_completed(Id)) as int;
            Orders_completed = await Get_orders_completed(Id);
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

///get user details

// try{
//           final url = Uri.parse('http://ivalunch-001-site1.atempurl.com/api/User/GetUserDetail/123');
//           final headers = {'Content-Type': 'application/json','Authorization' : 'Basic ' + base64Encode(utf8.encode('${Authusername}:${Authpassword}'))};

//         final response = await http.get(url, headers: headers);

//         if (response.statusCode == 200) {
//           final data = jsonDecode(response.body);
//           print('Login data retrival: $data');
//           emit(AuthSuccessfull(
//             successMessage: "You have retrived the data"));
//         } else {
//           print('Login failed: ${response.reasonPhrase}');
//           emit(AuthFailed(errorMessage: "${response.reasonPhrase}"));
//         }

//         }catch(e){
//           emit(AuthFailed(errorMessage: "Something went wrong"));
//         }

//get the no of orders

// try{
//           final url = Uri.parse('http://ivalunch-001-site1.atempurl.com/api/User/GetEmployeeLunchCount/123');
//           final headers = {'Content-Type': 'application/json','Authorization' : 'Basic ' + base64Encode(utf8.encode('${Authusername}:${Authpassword}'))};

//         final response = await http.get(url, headers: headers);

//         if (response.statusCode == 200) {
//           final data = jsonDecode(response.body);
//           print('no of orders retrived: $data');
//           emit(AuthSuccessfull(
//             successMessage: "You have retrived the data"));
//         } else {
//           print('retrive failed: ${response.reasonPhrase}');
//           emit(AuthFailed(errorMessage: "${response.reasonPhrase}"));
//         }

//         }catch(e){
//           emit(AuthFailed(errorMessage: "Something went wrong"));
//         }

Future<int> Get_orders_completed(int id) async {
  try {
    final url = Uri.parse(
        'http://ivalunch-001-site1.atempurl.com/api/User/GetEmployeeLunchCount/${id.toString()}');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic ' +
          base64Encode(utf8.encode('${Authusername}:${Authpassword}')),
    };

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      // final data = jsonDecode(response.body);
      // print('Number of orders retrieved: $data');
      dynamic fulldata = jsonDecode(response.body);

      print(fulldata['data']);
      return fulldata['data'];
    } else {
      print('Failed to retrieve orders: ${response.reasonPhrase}');
      // Return empty map or handle error according to your app logic
      return 0;
    }
  } catch (e) {
    print('Error: $e');
    return 0;
  }
}
