import 'package:expense_tracker/models/expense.dart';

class ExpenseData {
  //list of all expenses
  List<ExpenseItem> overallExpenseList = [
    /* Expense(
      id: 1,
      title: 'Groceries',
      amount: 100.0,
      date: DateTime.now(),
    ),
    Expense(
      id: 2,
      title: 'Fuel',
      amount: 50.0,
      date: DateTime.now(),
    ),
    Expense(
      id: 3,
      title: 'Rent',
      amount: 500.0,
      date: DateTime.now(),
    ),
    Expense(
      id: 4,
      title: 'Internet',
      amount: 50.0,
      date: DateTime.now(),
    ),
    Expense(
      id: 5,
      title: 'Electricity',
      amount: 100.0,
      date: DateTime.now(),
    ),
    Expense(
      id: 6,
      title: 'Water',
      amount: 50.0,
      date: DateTime.now(),
    ),
    Expense(
      id: 7,
      title: 'Phone',
      amount: 50.0,
      date: DateTime.now(),
    ),
    Expense(
      id: 8,
      title: 'Insurance',
      amount: 100.0,
      date: DateTime.now(),
    ),
    Expense(
      id: 9,
      title: 'Health',
      amount: 50.0,
      date: DateTime.now(),
    ),
    Expense(
      id: 10,
      title: 'Entertainment',
      amount: 100.0,
      date: DateTime.now(),
    ),
    */
  ];

  //get expense list
  List<ExpenseItem> getAllExpenseList() {
    return overallExpenseList;
  }

  //add new expense
  void addNewExpense(ExpenseItem newExpense) {
    overallExpenseList.add(newExpense);
  }

  //delete expense
  void deleteExpense(ExpenseItem expense) {
    overallExpenseList.remove(expense);
  }

  //get weekday(mon,tues,wed,thurs,fri,sat,sun)from a dateTime object
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

  //get the date for the start of the week
  DateTime startOfWeek() {
    DateTime? startOfWeek;

    //get today's date
    DateTime today = DateTime.now();

    //go back from today to the start of the week
    for (int i = 0; i < 7; i++) {
      if (getWeekday(today.subtract(Duration(days: i))) == 'Mon') {
        startOfWeek = today.subtract(Duration(days: i));
      }
    }
    return startOfWeek!;
  }
}
