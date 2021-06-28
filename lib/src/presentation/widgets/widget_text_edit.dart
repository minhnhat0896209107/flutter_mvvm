import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';

class WidgetTextEdit extends StatelessWidget {
  final String name;
  final Color? color;
  final TextStyle? style;
  final GestureTapCallback? callback;
  const WidgetTextEdit(
      {Key? key,
      required this.name,
      required this.style,
      this.callback,
      this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) => InkWell(
        onTap: callback,
        child: Container(
          child: Text(
            name,
            maxLines: 2,
            style: style,
            textAlign: TextAlign.center,
          ),
        ),
      );
}
