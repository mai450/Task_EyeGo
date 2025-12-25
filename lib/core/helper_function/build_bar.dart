import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String errMessage) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(behavior: SnackBarBehavior.floating, content: Text(errMessage)));
}
