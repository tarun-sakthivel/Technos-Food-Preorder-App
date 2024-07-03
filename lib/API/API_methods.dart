

import 'dart:convert';

import 'package:food_preorder_app/API/APIinfos.dart';
import 'package:food_preorder_app/API/APIutils.dart';
import 'package:food_preorder_app/UserModel.dart';
import 'package:http/http.dart' as http;


//ABOUT THE PAGE
//conatins all the function for the API calls
//NOTE NOTE : login function is avaibale in the AuthbLoc page 

//returns the user datails
Future<Map<String,dynamic>> Get_user_details(int id) async {
 
      final url = Uri.parse('${Baseurl.toString()}/api/User/GetUserDetail/${id}');
      final headers = {'Content-Type': 'application/json','Authorization' : 'Basic ' + base64Encode(utf8.encode('${Authusername}:${Authpassword}'))};
          
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
          
          
          Map<String, dynamic> fulldata = jsonDecode(response.body);
          Map<String, dynamic> data = fulldata['data'];
          print('Login data retrival: $data');
          Add_data(data);
          return data;
          
      } else {
          print('Login failed: ${response.reasonPhrase}');
          return {};
          
      }

       
}





//Returns no of order completed by the user for that particular month
Future<int> Get_orders_completed(int id) async {
  try {
    final url = Uri.parse('${Baseurl.toString()}/api/User/GetEmployeeLunchCount/${id.toString()}');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic ' + base64Encode(utf8.encode('${Authusername}:${Authpassword}')),
    };

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      
      dynamic fulldata = jsonDecode(response.body);
      
      // print(fulldata['data']);
      return fulldata['data'];
      
    } else {
      // print('Failed to retrieve orders: ${response.reasonPhrase}');
      
      return 0;
    }
  } catch (e) {
    // print('Error: $e');
    return 0;
   
  }
}


Future<List<DateTime>> Get_Pre_Orders(int id) async {
 
      final url = Uri.parse('${Baseurl.toString()}/api/User/GetPreOrders/${id}');
      final headers = {'Content-Type': 'application/json','Authorization' : 'Basic ' + base64Encode(utf8.encode('${Authusername}:${Authpassword}'))};
          
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
          
          
          dates = separateTheDates(response.body);
          //TODO: when gettign clean data get the dates alone and put it in the dates list
          // print("API dates ===================");
          // print(dates);
          return dates;
          
      } else {
          // print('pre order data retrival: ${response.reasonPhrase}');
          return [];
          
      }

       
}




Future<List<DateTime>> pushPreLunchDetail(int id, List<DateTime> dateList) async {
  try {
    final url = Uri.parse('${Baseurl.toString()}/api/User/GetPreLunchDetail');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic ' + base64Encode(utf8.encode('${Authusername}:${Authpassword}')),
    };

    final body = jsonEncode({
      'id': id.toString(),
      'DateList': dateList.map((date) => {'date': date.toIso8601String()}).toList(),
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final fulldata = jsonDecode(response.body);
      
      List<dynamic> data = fulldata['data'];
      List<DateTime> dates = data.map((item) => DateTime.parse(item['date'])).toList();
      
      return dates;
    } else {
      //print('Failed to retrieve details: ${response.reasonPhrase}');
      return [];
    }
  } catch (e) {
    //print('Error: $e');
    return [];
  }
}