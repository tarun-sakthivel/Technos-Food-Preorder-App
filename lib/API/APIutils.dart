



import 'dart:convert';

List<Map<String, String>> setDataForPOST(List<DateTime> datetimeList) {
  List<Map<String, String>> formattedDates = [];

  for (DateTime dt in datetimeList) {
    String formattedDate = '${dt.year}-${_twoDigits(dt.month)}-${_twoDigits(dt.day)}'; // Format as 'YYYY-MM-DD'
    formattedDates.add({'date': formattedDate});
  }

  return formattedDates;
}

String _twoDigits(int n) {
  if (n >= 10) return '$n';
  return '0$n';
}




List<DateTime> separateTheDates(String jsonResponse) {
  // Decode the JSON response into a Map
  Map<String, dynamic> response = jsonDecode(jsonResponse);

  // Extract the list of data
  List<dynamic> dataList = response['data'];

  // Map the list of data to a list of DateTime objects
  List<DateTime> dates = dataList.map((data) => DateTime.parse(data['date'] as String)).toList();

  return dates;
}