import 'dart:convert';
import 'package:food_preorder_app/API/APIinfos.dart';
import 'package:food_preorder_app/UserModel.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'history_bloc_event.dart';
part 'history_bloc_state.dart';

class HistoryBlocBloc extends Bloc<HistoryBlocEvent, HistoryBlocState> {
  HistoryBlocBloc() : super(HistoryBlocInitial()) {
    on<GetLogData>((event, emit) async {
      try {
        emit(dataLoading());
        String dateSelected =
            "${event.selectedYear}-${event.selectedmonth.toString().substring(5, 7)}-01";
        DateTime history = DateTime(event.selectedYear,
            int.parse(event.selectedmonth.toString().substring(5, 7)), 26);
        print(int.parse(event.selectedmonth.toString().substring(5, 7)));

        final url = Uri.parse('$Baseurl/api/User/UserLunchHistory');
        final headers = {
          'Content-Type': 'application/json',
          'Authorization':
              'Basic ${base64Encode(utf8.encode('11184427:60-dayfreetrial'))}'
        };
        print(history);
        final body = jsonEncode({
          'id': '$Id',
          'datetime': history.toIso8601String(),
        });

        final response = await http.post(url, headers: headers, body: body);

        if (response.statusCode == 200) {
          Map<String, dynamic> jsonDataMap = jsonDecode(response.body);

          // Extract data list
          List<dynamic> dataList = jsonDataMap['data'];

          // Convert lunchTime strings to DateTime objects
          List<DateTime> lunchTimes = dataList
              .map((item) => DateTime.parse(item['lunchTime']))
              .toList();

          // Print the result
          print(lunchTimes);

          //   print('User lunch history: $data');
          print('User lunch history: $lunchTimes');
          emit(dataSuccessfull(
            data: lunchTimes,
            successMessage: 'Data successfull',
            selectedmonth: event.selectedmonth,
            yearSelected: event.selectedYear,
          ));
        } else if (response.statusCode == 401) {
          emit(dataFailed(errorMessage: "Unauthorized"));
        } else {
          print(
              'Failed to get user lunch history: API ${response.reasonPhrase}');
          emit(dataFailed(errorMessage: '${response.reasonPhrase} '));
          print(dateSelected);
        }
      } on Exception {
        // TODO
        emit(dataFailed(errorMessage: "Data fetching failed"));
      }
    });
  }
}
