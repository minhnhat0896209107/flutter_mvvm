import 'package:flutter/material.dart';

class WidgetCircleImage extends StatelessWidget {
  final Color color;
  final double width, height;
  WidgetCircleImage(
      {required this.color, required this.width, required this.height});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color));
  }
}
