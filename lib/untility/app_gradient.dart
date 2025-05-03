import 'package:flutter/material.dart';

LinearGradient customGradient(Color startColor, Color endColor) {
  return LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.bottomRight,
    colors: [startColor, endColor],
  );
}
