import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: const Color(0xFF3D30A2));
var kDarkColorScheme =
    ColorScheme.fromSeed(brightness: Brightness.dark, seedColor: const Color(0xFF3D30A2));

void main() {
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      colorScheme: kDarkColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kDarkColorScheme.onPrimary,
          foregroundColor: kDarkColorScheme.onPrimaryContainer),
      cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.all(8)),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer),
      ),
      // textTheme: ThemeData().textTheme.copyWith(
      //       titleLarge: TextStyle(
      //           fontWeight: FontWeight.bold,
      //          // color: kDarkColorScheme.secondary,
      //           fontSize: 18),
          
      //     ),
    ),

    
    theme: ThemeData().copyWith(
      colorScheme: kColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer),
      cardTheme: const CardTheme().copyWith(
        color: kColorScheme.secondaryContainer,
        margin: const EdgeInsets.all(8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer),
      ),
      textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorScheme.secondaryContainer,
                fontSize: 18),
          ),
    ),
    themeMode: ThemeMode.system,
    home: const Expenses(),
  ));
}
