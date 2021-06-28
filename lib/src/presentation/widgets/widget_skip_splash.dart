import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/configs/configs.dart';

class WidgetSkipSplash extends StatelessWidget {
  final String name;
  WidgetSkipSplash({required this.name});
  @override
  Widget build(BuildContext context) => Text(
        name,
        style: TextStyle(fontSize: 16, color: TEXT_SKIP_COLOR),
      );
}
