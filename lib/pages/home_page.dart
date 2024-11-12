import 'package:expense_tracker/components/expense_summary.dart';
import 'package:expense_tracker/components/expense_tile.dart';
import 'package:expense_tracker/data/expense_data.dart';
import 'package:expense_tracker/models/expense_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //text controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountDollarController = TextEditingController();
  final TextEditingController _amountCentsController = TextEditingController();
  void addNewExpense() {
    //add new expense
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Add New Expense',
          style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Add new expense details',
              style: TextStyle(
                  color: Colors.amber,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            Row(
              children: [
                //dollar textfield
                Expanded(
                  child: TextField(
                    controller: _amountDollarController,
                    decoration: const InputDecoration(labelText: 'Dollar'),
                  ),
                ),

                //cents textfield
                TextField(
                  controller: _amountCentsController,
                  decoration: const InputDecoration(labelText: 'Cents'),
                ),
              ],

              //cents textfield
            )
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.amberAccent),
            ),
          ),
          TextButton(
            onPressed: () {
              save();
              // Add new expense
              Navigator.of(context).pop();
            },
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.amberAccent),
            ),
          ),
        ],
      ),
    );
  }

  //save expense
  void save() {
    //putting the dollar and cents together
    double dollars = double.tryParse(_amountDollarController.text) ?? 0;
    double cents = (double.tryParse(_amountCentsController.text) ?? 0) / 100;
    double amount = dollars + cents;
    //create expense item
    ExpenseItem newExpense = ExpenseItem(
      name: _nameController.text,
      amount: amount,
      date: DateTime.now(),
    );
    //add the new expense
    Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpense);

    //clear the text fields
    _nameController.clear();
    _amountDollarController.clear();
    _amountCentsController.clear();
    
  }

  void cancel() {
    //clear the text fields
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: addNewExpense,
            backgroundColor: Colors.amber,
            child: const Icon(Icons.add),
          ),
          body: ListView(
            children: [
              const SizedBox(
                height: 25,
              ),
              //weekly summary
              ExpenseSummary(startOfWeek: value.startOfWeek()),

              const SizedBox(
                height: 25,
              ),

              //expense list
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: value.getAllExpenseList().length,
                itemBuilder: (context, index) => ExpenseTile(
                  name: value.getAllExpenseList()[index].name,
                  amount: value.getAllExpenseList()[index].amount,
                  date: value.getAllExpenseList()[index].date,
                ),
              ),
            ],
          )),
    );
  }
}
