import 'package:flutter/material.dart';

class AppSpacing {
  static const EdgeInsets pageAlignment =
      EdgeInsets.only(left: defaultSmall, right: defaultSmall, top: defaultMedium, bottom: defaultLarge);
  static const EdgeInsets itemListAlignment = EdgeInsets.symmetric(horizontal: defaultSmall, vertical: 8);

  static const double defaultSmall = 16;
  static const double defaultMedium = 32;
  static const double defaultLarge = 64;
}
