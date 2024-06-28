import 'package:flutter/material.dart';

void showErrorSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: Colors.red,
    action: SnackBarAction(
      label: 'اغلاق',
      textColor: Colors.white,
      onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
    ),
  );
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

int calculateAge(DateTime? birthDate) {
  DateTime today = DateTime.now();
  int age = today.year - birthDate!.year;
  if (today.month < birthDate.month || (today.month == birthDate.month && today.day < birthDate.day)) {
    age--;
  }
  return age;
}
