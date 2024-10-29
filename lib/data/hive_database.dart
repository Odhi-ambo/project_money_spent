import 'package:expense_tracker/models/expense_item.dart';
import 'package:hive/hive.dart';

class HiveDatabase {
  //reference our hive box
  final _myBox = Hive.box('expense_database');

  //write data
  void saveData(List<ExpenseItem> allExpense){
    /*

    */
  }

  //read data
}
