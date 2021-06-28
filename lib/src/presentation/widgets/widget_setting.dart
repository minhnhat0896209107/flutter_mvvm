import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/constanst/app_colors.dart';

class WidgetSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
          child: Icon(
        Icons.settings,
        color: PURPLE_COLOR,
        size: 30,
      ));
}
