import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';

class WidgetCircleSplash extends StatelessWidget {
  final int index;
  WidgetCircleSplash({required this.index});
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 10,
              height: 10,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == 0 ? PURPLE_COLOR : CICULAR_GREY_COLOR)),
          Container(
              width: 10,
              height: 10,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == 1 ? PURPLE_COLOR : CICULAR_GREY_COLOR)),
          Container(
              width: 10,
              height: 10,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == 2 ? PURPLE_COLOR : CICULAR_GREY_COLOR)),
        ],
      );
}
