import 'package:flutter/material.dart';
import 'package:gradution/core/styles/colors.dart';

class TablePaymentAndTransaction extends StatelessWidget {
  final int rows;
  final int columns;

  const TablePaymentAndTransaction({super.key, required this.rows, required this.columns});

  @override
  Widget build(BuildContext context) {
    // توليد البيانات
    final List<List<String>> data = List.generate(
      rows,
      (row) => List.generate(columns, (col) => 'بيان ${row + 1}-${col + 1}'),
    );

    return Table(
      border: TableBorder.all(color: Colors.grey),
      columnWidths: {
        for (int i = 0; i < columns; i++) i: FlexColumnWidth(),
      },
      children: [
        // Header row (أول صف من البيانات)
        TableRow(
          decoration:  BoxDecoration(color: Colors.grey.shade500),
          children: List.generate(columns, (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                data[0][index],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            );
          }),
        ),
        // باقي الصفوف
        for (int row = 1; row < rows; row++)
          TableRow(
            decoration: BoxDecoration(
              color: row.isEven? Colors.white : maincolor.withOpacity(0.4), 
            ),
            children: List.generate(columns, (col) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  data[row][col],
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black),
                ),
              );
            }),
          ),
      ],
    );
  }
}
