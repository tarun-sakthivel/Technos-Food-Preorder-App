//create a list where the elements are datetime
List<DateTime> dates = [
  DateTime(2024, 6, 5),
  DateTime(2024, 6, 25),
  DateTime(2024, 6, 19),
  DateTime(2024, 6, 20),
  DateTime(2024, 6, 21),
  DateTime(2024, 6, 22),
  DateTime(2024, 6, 27),
  DateTime(2024,7,12),
];

List<DateTime> dummydates = [];
List<DateTime> previous_dates = [];
List<DateTime> future_dates = [];
//List<DateTime> modifieddate = {};

List<DateTime> getFutureDates(List<DateTime> dates) {
  // Get the current date without the time component
  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);

  // Sort the dates list

  // Clear the futureDates list to ensure it's empty before adding new elements
  future_dates.clear();

  // Filter out dates that are today or in the future and add them to the futureDates list
  for (DateTime date in dates) {
    DateTime dateWithoutTime = DateTime(date.year, date.month, date.day);
    if (!dateWithoutTime.isBefore(today)) {
      print(date);
      future_dates.add(date);
    }
  }
  return future_dates;
}

List<DateTime> getPreviousDates(List<DateTime> dates) {
  DateTime today = DateTime.now();

  // Filter dates that are on or after today
  List<DateTime> filteredDates =
      dates.where((date) => date.isBefore(today)).toList();

  // // Sort dates in ascending order
  // List<DateTime> sortedDatesList = filteredDates.toList()..sort((a, b) => a.compareTo(b));

  // // Convert sorted list back to a List
  // List<DateTime> sortedDatesSet = sortedDatesList.toSet();

  return filteredDates;
}

int selectedYear = 0;

DateTime _selectedDate = DateTime.now();

late int Id;
late String UserName;
late String FirstName;
late String LastName;
late String Password;
late String Company;
late String Employeecode;
late int Orders_completed = 90;




void Add_data(Map<String,dynamic> data){
          Id = data['id'];
         Employeecode = data['employeecode'];
         FirstName = data['firstname'];
         LastName = data['lastname'];
         UserName = data['username'];
         Company = data['company'];
        //  print(Id);
        //  print(Employeecode);
        //  print(FirstName);
        //  print(LastName);
        //  print(UserName);
        //  print(Company);
}

void Clear_data(){
  Id = 0;
  Employeecode = "";
  FirstName = "";
  LastName = "";
  UserName = "";
  Company = "";
  print("data cleared  from the app local storage");

}