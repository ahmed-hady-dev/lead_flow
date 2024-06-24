import 'package:flutter/material.dart';

import '../router/router.dart';

extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}

extension DoubleExtension on double {
  double toFahrenheit() => (this * 1.8 + 32).toDouble();
}

extension Height on Widget {
  double get height => MediaQuery.of(GlobalRouter.currentContext!).size.height;
}

extension Width on Widget {
  double get width => MediaQuery.of(GlobalRouter.currentContext!).size.width;
}
