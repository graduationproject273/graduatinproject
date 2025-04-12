import 'package:flutter/material.dart';

class DropdownDatePicker extends StatefulWidget {
  @override
  _DropdownDatePickerState createState() => _DropdownDatePickerState();
}

class _DropdownDatePickerState extends State<DropdownDatePicker> {
  int? selectedDay;
  int? selectedMonth;
  int? selectedYear;

  List<int> days = List.generate(31, (index) => index + 1);
  List<int> months = List.generate(12, (index) => index + 1);
  List<int> years =
      List.generate(100, (index) => 2025 - index); // from 2025 to 1926

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // Day
            Expanded(
              child: DropdownButton<int>(
                dropdownColor: Colors.white,
                value: selectedDay,
                hint: Text("Day"),
                icon: Icon(Icons.keyboard_arrow_down_rounded),
                iconSize: 30,
                isExpanded: true,
                items: days.map((day) {
                  return DropdownMenuItem(
                    value: day,
                    child: Text(day.toString()),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() => selectedDay = value);
                },
              ),
            ),

            SizedBox(width: 10),

            // Month
            Expanded(
              child: DropdownButton<int>(
                dropdownColor: Colors.white,
                value: selectedMonth,
                icon: Icon(Icons.keyboard_arrow_down_rounded),
                iconSize: 30,
                hint: Text("Month"),
                isExpanded: true,
                items: months.map((month) {
                  return DropdownMenuItem(
                    value: month,
                    child: Text(_monthName(month)),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() => selectedMonth = value);
                },
              ),
            ),

            SizedBox(width: 10),

            // Year
            Expanded(
              child: DropdownButton<int>(
                dropdownColor: Colors.white,
                value: selectedYear,
                icon: Icon(Icons.keyboard_arrow_down_rounded),
                iconSize: 30,
                hint: Text("Year"),
                isExpanded: true,
                items: years.map((year) {
                  return DropdownMenuItem(
                    value: year,
                    child: Text(year.toString()),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() => selectedYear = value);
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        if (selectedDay != null &&
            selectedMonth != null &&
            selectedYear != null)
          Text(
            "Selected Date: $selectedDay / $selectedMonth / $selectedYear",
            style: TextStyle(fontSize: 18),
          ),
      ],
    );
  }

  String _monthName(int month) {
    const englishMonths = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    return englishMonths[month - 1];
  }
}
