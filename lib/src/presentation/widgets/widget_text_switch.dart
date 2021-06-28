import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/presentation.dart';

class WidgetTextSwitch extends StatelessWidget {
  final String name;
  WidgetTextSwitch({Key? key, required this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                margin: EdgeInsets.only(left: 5),
                child: WidgetTextEdit(name: name, style: STYLE_LARGE)),
            Container(
                margin: EdgeInsets.only(right: 10),
                child: WidgetSwitchSetting())
          ],
        ),
      );
}
