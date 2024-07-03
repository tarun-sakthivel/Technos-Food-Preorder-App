import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_preorder_app/Constants/Color.dart';
import 'package:food_preorder_app/bloc/HistoryBloc/history_bloc_bloc.dart';

class CalendarPage extends StatefulWidget {
  final List<int> years = List<int>.generate(101, (int index) => 2000 + index);

  CalendarPage({super.key});
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
          decoration: const BoxDecoration(
              color: Kivagreen,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14), topRight: Radius.circular(14))),
          child: const Padding(
            padding: EdgeInsets.only(left: 30.0, top: 18),
            child: Text(
              'Filter',
              style: TextStyle(
                  color: Colors.white, fontSize: 22, fontFamily: 'Poppins'),
            ),
          ),
        ),

        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
          height: 330,
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
      ],
    );
  }
}

class MonthPickerWidget extends StatefulWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onChanged;
  final List<int> years = List<int>.generate(101, (int index) => 2000 + index);
  MonthPickerWidget({
    super.key,
    required this.selectedDate,
    required this.onChanged,
  });

  @override
  _MonthPickerWidgetState createState() => _MonthPickerWidgetState();
}

class _MonthPickerWidgetState extends State<MonthPickerWidget> {
  DateTime? selectedDate;
  int selectedYear = DateTime.now().year;
  final List<int> years = List<int>.generate(101, (int index) => 2000 + index);
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
      print(_selectedDate);
      widget.onChanged(_selectedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<int> years =
        List<int>.generate(101, (int index) => 2000 + index);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                onTap: () {},
                child: Text(
                  value.toString(),
                  style: const TextStyle(fontSize: 11),
                ),
              );
            }).toList(),
          ),
        ),
        GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 1),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BlocBuilder<HistoryBlocBloc, HistoryBlocState>(
                builder: (context, state) {
                  if (state is dataLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is dataSuccessfull) {
                    return TextButton(
                        onPressed: () {
                          context.read<HistoryBlocBloc>().add(GetLogData(
                              selectedmonth: _selectedDate,
                              selectedYear: selectedYear));
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => Historypage()));
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(top: 20.0, bottom: 8.0),
                          child: Text('OK',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Poppins')),
                        ));
                  }
                  return TextButton(
                      onPressed: () {
                        context.read<HistoryBlocBloc>().add(GetLogData(
                            selectedmonth: _selectedDate,
                            selectedYear: selectedYear));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => Historypage()));
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(top: 20.0, bottom: 8.0),
                        child: Text('OK',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 11,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Poppins')),
                      ));
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
