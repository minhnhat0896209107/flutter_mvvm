import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetTextEditStart extends StatelessWidget {
  final String name;
  final Color? color;
  final TextStyle? style;
  final GestureTapCallback? callback;
  const WidgetTextEditStart(
      {Key? key,
      required this.name,
      this.color,
      required this.style,
      this.callback})
      : super(key: key);
  @override
  Widget build(BuildContext context) => InkWell(
        onTap: callback,
        child: Container(
          child: Text(
            name,
            maxLines: 2,
            style: style,
            textAlign: TextAlign.start,
          ),
        ),
      );
}
