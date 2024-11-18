import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ExpenseTile extends StatelessWidget {
  final String name;
  final double amount;
  final DateTime date;
  final Function(BuildContext)? deleteTapped;

  const ExpenseTile(
      {super.key,
      required this.name,
      required this.amount,
      required this.date,
      required this.deleteTapped});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: StretchMotion(), children: [
        //delete button
        SlidableAction(
          onPressed: deleteTapped,
          icon: Icons.delete,
          backgroundColor: Colors.redAccent,
          borderRadius: BorderRadius.circular(5),
        )
      ]),
      child: ListTile(
        title: Text(
          name,
          style: const TextStyle(
              color: Colors.amber,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        subtitle: Text('${date.day}/${date.month}/${date.year}'),
        trailing: Text(
          'kshs $amount',
          style: const TextStyle(
              color: Colors.redAccent,
              fontStyle: FontStyle.italic,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
