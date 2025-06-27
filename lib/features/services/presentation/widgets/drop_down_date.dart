import 'package:flutter/material.dart';

class DropdownDatePicker extends StatefulWidget {
  final void Function(DateTime)? onDateSelected;

  const DropdownDatePicker({super.key, this.onDateSelected});

  @override
  _DropdownDatePickerState createState() => _DropdownDatePickerState();
}

class _DropdownDatePickerState extends State<DropdownDatePicker> {
  int? selectedDay;
  int? selectedMonth;
  int? selectedYear;

  List<int> days = List.generate(31, (index) => index + 1);
  List<int> months = List.generate(12, (index) => index + 1);
  List<int> years = List.generate(100, (index) => 2025 - index);

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
                hint: const Text("Day"),
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
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
                  _updateDateIfComplete();
                },
              ),
            ),
            const SizedBox(width: 10),

            // Month
            Expanded(
              child: DropdownButton<int>(
                dropdownColor: Colors.white,
                value: selectedMonth,
                hint: const Text("Month"),
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                iconSize: 30,
                isExpanded: true,
                items: months.map((month) {
                  return DropdownMenuItem(
                    value: month,
                    child: Text(_monthName(month)),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() => selectedMonth = value);
                  _updateDateIfComplete();
                },
              ),
            ),
            const SizedBox(width: 10),

            // Year
            Expanded(
              child: DropdownButton<int>(
                dropdownColor: Colors.white,
                value: selectedYear,
                hint: const Text("Year"),
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                iconSize: 30,
                isExpanded: true,
                items: years.map((year) {
                  return DropdownMenuItem(
                    value: year,
                    child: Text(year.toString()),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() => selectedYear = value);
                  _updateDateIfComplete();
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        if (selectedDay != null && selectedMonth != null && selectedYear != null)
          Text(
            "Selected Date: $selectedDay / $selectedMonth / $selectedYear",
            style: const TextStyle(fontSize: 18),
          ),
      ],
    );
  }

  void _updateDateIfComplete() {
    if (selectedDay != null && selectedMonth != null && selectedYear != null) {
      final selectedDate = DateTime(selectedYear!, selectedMonth!, selectedDay!);
      widget.onDateSelected?.call(selectedDate);
    }
  }

  String _monthName(int month) {
    const englishMonths = [
      "January", "February", "March", "April", "May", "June",
      "July", "August", "September", "October", "November", "December"
    ];
    return englishMonths[month - 1];
  }
}
