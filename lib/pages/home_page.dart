import 'package:expense_tracker/data/expense_data.dart';
import 'package:expense_tracker/models/expense_item.dart';
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
  final TextEditingController _amountController = TextEditingController();
  void addNewExpense() {
    //add new expense
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Expense'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Add new expense details'),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(labelText: 'Amount'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              save();
              // Add new expense
              Navigator.of(context).pop();
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  //save expense
  void save() {
    //create expense item
    ExpenseItem newExpense = ExpenseItem(
      name: _nameController.text,
      amount: double.tryParse(_amountController.text) ?? 0.0,
      date: DateTime.now(),
    );
    //add the new expense
    Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpense);

    //clear the text fields
    _nameController.clear();
    _amountController.clear();

  }

  void cancel() {
    //clear the text fields
    _nameController.clear();
    _amountController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: addNewExpense,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: value.getAllExpenseList().length,
            itemBuilder: (context, index) => ListTile(
                  title: Text(value.getAllExpenseList()[index].name),
                )),
      ),
    );
  }
}
