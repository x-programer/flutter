import 'package:flutter/material.dart';

class Dailogs {
  static void showSnapBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
