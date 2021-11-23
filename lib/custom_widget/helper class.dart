import 'package:flutter/material.dart';
class Value {
  static String? value;
  static void setString(String newValue) {
    value = newValue;
  }

  static String? getString() {
    return value;
  }
}