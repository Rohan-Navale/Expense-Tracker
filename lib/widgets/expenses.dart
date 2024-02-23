import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  // stateful widget because the UI will be updated
  // This is a widget class

  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    //creates a state by returning the widget as mentioned
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  // This is state class

  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Movie',
        amount: 480,
        date: DateTime.now(),
        category: Category.Leisure),
    Expense(
        title: 'Petrol',
        amount: 220,
        date: DateTime.now(),
        category: Category.Travel)
  ]; // this list has the expenses list

  void _openAddExpensesOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense Deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final length = MediaQuery.of(context).size.height;

    Widget mainContent = const Center(
      child: Text('Add New Expenses!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
              onPressed: _openAddExpensesOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(
                    child:
                        mainContent), // ExpensesList class[in widgets->expensesList->expenses_list] is called by sending Lift of expenses in arguments
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: _registeredExpenses)),
                Expanded(
                    child:
                        mainContent), // ExpensesList class[in widgets->expensesList->expenses_list] is called by sending Lift of expenses in arguments
              ],
            ),
    );
  }
}
