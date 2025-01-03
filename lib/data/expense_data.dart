import 'package:expense_tracker/data/hive_database.dart';
import 'package:expense_tracker/dateTime/date_time_helper.dart';

import 'package:expense_tracker/models/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseData extends ChangeNotifier {
  // Get expense list
  List<ExpenseItem> overallExpenseList = [];

  List<ExpenseItem> getAllExpenseList() {
    return overallExpenseList;
  }

  //prepare data to be displayed in the chart
  final db = HiveDatabase();
  void prepareData() {
    //if their exists data, get it
    if (db.readData().isNotEmpty) {
      overallExpenseList = db.readData();
    }

    //if not, create a new list
  }

  // Add new expense
  void addNewExpense(ExpenseItem newExpense) {
    overallExpenseList.add(newExpense);

    // Notify listeners
    notifyListeners();
    db.saveData(overallExpenseList);
  }

  // Delete expense
  void deleteExpense(ExpenseItem expense) {
    overallExpenseList.remove(expense);

    // Notify listeners
    notifyListeners();
    db.saveData(overallExpenseList);
  }

  // Get weekday (Mon, Tue, Wed, Thu, Fri, Sat, Sun) from a DateTime object
  String getWeekday(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  // Get the date for the start of the week
  DateTime startOfWeek() {
    DateTime today = DateTime.now();
    for (int i = 0; i < 7; i++) {
      DateTime currentDay = today.subtract(Duration(days: i));
      if (currentDay.weekday == DateTime.monday) {
        return currentDay;
      }
    }
    // Fallback in case of error, although logically not needed
    return today;
  }

  // Calculate daily expense summary
  Map<String, double> calculateDailyExpenseSummary() {
    Map<String, double> dailyExpenseSummary = {};
    for (var expense in overallExpenseList) {
      // Convert DateTime object to string in yyyy-MM-dd format
      String date = convertDateTimeToString(expense.date);
      double amount =
          expense.amount; // No casting needed if amount is already a double

      if (dailyExpenseSummary.containsKey(date)) {
        dailyExpenseSummary[date] = dailyExpenseSummary[date]! + amount;
      } else {
        dailyExpenseSummary[date] = amount;
      }
    }
    return dailyExpenseSummary;
  }

  // Helper function to convert DateTime to string in yyyy-MM-dd format
  //String convertDateTimeToString(DateTime dateTime) {
  // Assuming this method is defined elsewhere, like DateFormat from intl package
  // return '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
}
