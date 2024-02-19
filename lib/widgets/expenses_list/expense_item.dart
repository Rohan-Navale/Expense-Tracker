import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

// this class returns a widget in the form of card with details defined for a expense
class ExpenseItem extends StatelessWidget {
  // this class is called from expenses_list.dart class by sending a single item in the list by reffereing it's index
  const ExpenseItem(this.expense, {super.key});

  final Expense
      expense; //this expense will have different expense each time based on the item in the index of list

  @override
  Widget build(BuildContext context) {
    return Card(
      // card is used to display the item in a card format
      child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(expense.title, style: const TextStyle(fontWeight: FontWeight.bold),),//style: Theme.of(context).textTheme.titleLarge,
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                      '\₹ ${expense.amount.toStringAsFixed(2)}'), // toStringAsFixed(2) round-off to atmost 2 decimals
                  const Spacer(), // spacer is used to utilize the maximum availble space
                  Row(
                    children: [
                      Icon(categoryIcons[expense.category]),
                      const SizedBox(width: 8),
                      Text(expense.formattedDate),
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
