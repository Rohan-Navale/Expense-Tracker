import 'package:intl/intl.dart'; // third party package used to work with DateTime
import 'package:uuid/uuid.dart'; // third party package used to allocate unique id
import 'package:flutter/material.dart';

final formatter = DateFormat.yMd(); //formats date

const uuid = Uuid();

enum Category { Food,Travel,Leisure, Work }

const categoryIcons = {
  Category.Food: Icons.lunch_dining,
  Category.Travel: Icons.travel_explore,
  Category.Leisure: Icons.movie,
  Category.Work: Icons.work
}; // has the predefined icon types for each category

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4(); //.v4() allocates unique string id

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}
