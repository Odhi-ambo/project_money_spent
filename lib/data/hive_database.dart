import 'package:expense_tracker/models/expense_item.dart';
import 'package:hive/hive.dart';

class HiveDatabase {
  //reference our hive box
  final box = Hive.box("expense_database");

  //write data
  void saveData(List<ExpenseItem> allExpense){
    /*

    */
  }

  //read data
}
