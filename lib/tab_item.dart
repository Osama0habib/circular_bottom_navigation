import 'package:flutter/material.dart';

class TabItem {
  IconData icon;
  String title;
  // Color circleColor;
  Gradient circleColor;
  Color? circleStrokeColor;
  TextStyle labelStyle;

  TabItem(
    this.icon,
    this.title,
    this.circleColor, {
    this.circleStrokeColor,
    this.labelStyle = const TextStyle(fontWeight: FontWeight.bold),
  });
}
