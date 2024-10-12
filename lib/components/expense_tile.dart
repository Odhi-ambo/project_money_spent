import 'package:flutter/material.dart';

class ExpenseTile extends StatelessWidget {
  final String name;
  final double amount;
  final DateTime date;

  const ExpenseTile(
      {super.key,
      required this.name,
      required this.amount,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text(date.day.toString() +
          '/' +
          date.month.toString() +
          '/' +
          date.year.toString()),
      trailing: Text('kshs ' + amount.toString()),
    );
  }
}