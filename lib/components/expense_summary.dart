import 'package:expense_tracker/bargraph/bar_graph.dart';
import 'package:expense_tracker/data/expense_data.dart';
import 'package:expense_tracker/dateTime/date_time_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseSummary extends StatelessWidget {
  final DateTime startOfWeek;
  const ExpenseSummary({super.key, required this.startOfWeek});

  @override
  Widget build(BuildContext context) {
    //get yyyy-mm-dd format of the start of the week
    String sunday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 1)));

    return Consumer<ExpenseData>(
      builder: (context, value, child) => const SizedBox(
        height: 200,
        child: BarGraph(
            maxY: 200,
            sunAmount: 50,
            monAmount: 40,
            tueAmount: 95,
            wedAmount: 80,
            thuAmount: 100,
            friAmount: 90,
            satAmount: 85),
      ),
    );
  }
}
