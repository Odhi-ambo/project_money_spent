import 'package:expense_tracker/bargraph/bar_graph.dart';
import 'package:expense_tracker/data/expense_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseSummary extends StatelessWidget {
  final DateTime startOfWeek;
  const ExpenseSummary({super.key, required this.startOfWeek});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => SizedBox(
        height: 200,
        child: BarGraph(
            maxY: 100,
            sunAmount: 50,
            monAmount: 40,
            tueAmount: 100,
            wedAmount: 80,
            thuAmount: 100,
            friAmount: 90,
            satAmount: 85),
      ),
    );
  }
}
