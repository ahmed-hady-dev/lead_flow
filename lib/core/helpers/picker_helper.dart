import 'package:flutter/material.dart';

import '../router/router.dart';

class PickerHelper {
  static Future<DateTime?> pickDate() async {
    final DateTime currentDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: GlobalRouter.currentContext!,
      initialDate: DateTime(currentDate.year - 5, currentDate.month, currentDate.day),
      firstDate: DateTime(currentDate.year - 100),
      lastDate: DateTime(currentDate.year - 5, currentDate.month, currentDate.day),
      helpText: 'حدد تاريخ الميلاد',
      errorFormatText: 'ادخل التاريخ بشكل صحيح ',
      errorInvalidText: 'ادخل التاريخ بشكل صحيح',
      fieldHintText: 'حدد تاريخ الميلاد',
      fieldLabelText: 'تاريخ الميلاد',
    );
    return picked;
  }
}
