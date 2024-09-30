import 'package:isar/isar.dart';

class Expense {
  Id id = Isar.autoIncrement;
  late final String name;
  late final double amount;
  late final DateTime date;

  Expense({
    required this.name,
    required this.amount,
    required this.date,
  });
}
