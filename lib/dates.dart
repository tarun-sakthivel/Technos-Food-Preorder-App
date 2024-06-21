//create a list where the elements are datetime
Set<DateTime> dates = {DateTime(2024, 6, 5),
                        DateTime(2024, 6, 25),
                        DateTime(2024, 6, 19),
                        DateTime(2024, 6, 20),
                        DateTime(2024, 6, 21),
                        DateTime(2024, 6, 22),
                        DateTime(2024, 6, 27),};

Set<DateTime> future_dates = {};


Set<DateTime> getFutureDates(Set<DateTime> dates) {
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
