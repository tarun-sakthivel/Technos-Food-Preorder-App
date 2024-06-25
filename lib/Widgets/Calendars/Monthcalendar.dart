import 'package:flutter/material.dart';
import 'package:food_preorder_app/Constants/Text.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_preorder_app/Constants/Color.dart';
import 'package:food_preorder_app/Constants/Text.dart';
import 'package:food_preorder_app/Screens/LogPage/Historypage.dart';
import 'package:food_preorder_app/dates.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class CalendarPage extends StatefulWidget {
  final List<int> years = List<int>.generate(101, (int index) => 2000 + index);
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime? selectedDate;
  int selectedYear = DateTime.now().year;
  final List<int> years = List<int>.generate(101, (int index) => 2000 + index);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
//YearSelector(controller: , onYearSelected:(value) => yearSelected,),
        Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Kivagreen,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14), topRight: Radius.circular(14))),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Filter',
              style: TextStyle(
                  color: Colors.white, fontSize: 24, fontFamily: 'Poppins'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 38.0,
          ),
          child: DropdownButton<int>(
            isExpanded: false,
            isDense: true,
            dropdownColor: Kivawhite,
            menuMaxHeight: 240,
            value: selectedYear,
            onChanged: (int? newValue) {
              setState(() {
                selectedYear = newValue!;
              });
            },
            items: widget.years.map<DropdownMenuItem<int>>((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text(
                  value.toString(),
                  style: TextStyle(fontSize: 11),
                ),
              );
            }).toList(),
          ),
        ),

        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
          height: 220,
          width: 322,
          child: MonthPickerWidget(
            selectedDate: selectedDate ?? DateTime.now(),
            onChanged: (date) {
              setState(() {
                selectedDate = date;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Historypage()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 8.0),
                    child: Text('OK',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Poppins')),
                  ))
            ],
          ),
        )
      ],
    );
  }
}

class MonthPickerWidget extends StatefulWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onChanged;

  const MonthPickerWidget({
    Key? key,
    required this.selectedDate,
    required this.onChanged,
  }) : super(key: key);

  @override
  _MonthPickerWidgetState createState() => _MonthPickerWidgetState();
}

class _MonthPickerWidgetState extends State<MonthPickerWidget> {
  late DateTime _selectedDate;
  List<String> Months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'June',
    'July',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.selectedDate;
  }

  void _onMonthSelected(int month) {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, month);
      widget.onChanged(_selectedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 1),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 5.0, // Adjust spacing between rows/columns
        crossAxisSpacing: 5.0, // Adjust spacing between columns/rows
        childAspectRatio: 2, // Adjust aspect ratio of each item
      ),
      itemCount: 12,
      itemBuilder: (context, index) {
        final month = index + 1;
        final isSelected = month == _selectedDate.month;
        return GestureDetector(
          onTap: () => _onMonthSelected(month),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 22.0, vertical: 5.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: isSelected ? Kivagreen : Kivawhite,
              ),
              alignment: Alignment.center,
              child: Text(
                Months[index],
                style: TextStyle(
                  fontSize: 15,
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
