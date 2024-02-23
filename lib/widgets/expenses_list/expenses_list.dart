import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key,
      required this.expenses,
      required this.onRemoveExpense}); // expenses list is recieved from expenses.dart as argument

  final List<Expense> expenses; //now this expenses list has all the expenses
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // here listview builder is used instead of coulmn because the length of list is not defined
      // The list may grow with time. This ListView makes its elements scrolable automatically
      itemCount: expenses
          .length, // Listview function will be called expenses.length of times
      itemBuilder: (ctx, index) => Dismissible(
          background: Container(
            color: Theme.of(context).colorScheme.error,//.withOpacity(1),
            margin: EdgeInsets.symmetric(
                horizontal: Theme.of(context).cardTheme.margin!.horizontal,
                vertical: 8),
          ),
          key: ValueKey(expenses[index]),
          onDismissed: (direction) {
            onRemoveExpense(expenses[index]);
          },
          child: ExpenseItem(expenses[
              index])), //it access the item in the list based on index, starting from 0 to n-1
    );
  }
}
