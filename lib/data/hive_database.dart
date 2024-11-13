import 'package:expense_tracker/models/expense_item.dart';
import 'package:hive/hive.dart';

class HiveDatabase {
  //reference our hive box
  final box = Hive.box("expense_database");

  //write data
  void saveData(List<ExpenseItem> allExpense) {
    /*

    */

    List<List<dynamic>> allExpenseFormatted = [];
    for (var expense in allExpense) {
      List<dynamic> expenseFormatted = [
        expense.name,
        expense.amount,
        expense.date,
      ];
      allExpenseFormatted.add(expenseFormatted);
    }
    //finally lets save the data
    box.put("all_expense", allExpenseFormatted);
  }

  //read data
  List<ExpenseItem> readData() {
    List savedExpenses = box.get("all_expense") ?? [];
    List<ExpenseItem> allExpense = [];

    for (int i = 0; i < savedExpenses.length; i++) {
      //collect individual expense data
      String name = savedExpenses[i][0];
      double amount = savedExpenses[i][1];
      DateTime date = savedExpenses[i][2];

      //create an expense object
      ExpenseItem expense = ExpenseItem(name: name, amount: amount, date: date);
      //add the expense object to the list
      allExpense.add(expense);
    }
    return allExpense;
  }
}
