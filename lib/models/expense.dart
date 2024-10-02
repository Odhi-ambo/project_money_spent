import 'package:isar/isar.dart';

class ExpenseItem {
  Id id = Isar.autoIncrement;
  late final String name;
  late final double amount;
  late final DateTime date;

  ExpenseItem({
    required this.name,
    required this.amount,
    required this.date,
  });
}
