import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  void hideKeyboard() => FocusScope.of(this).requestFocus(FocusNode());

  void showSnackBar(String message) =>
      ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(message)));

  /// Akses langsung ke context.textTheme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Akses langsung ke Theme.of(context).colorScheme
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
