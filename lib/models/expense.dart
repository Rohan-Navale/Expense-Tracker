import 'package:intl/intl.dart'; // third party package used to work with DateTime
import 'package:uuid/uuid.dart'; // third party package used to allocate unique id
import 'package:flutter/material.dart';

final formatter = DateFormat.yMd(); //formats date

const uuid = Uuid();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.travel_explore,
  Category.leisure: Icons.movie,
  Category.work: Icons.work
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

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;
    
    return sum;
  }
}
