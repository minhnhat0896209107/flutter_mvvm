import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';

class WidgetButton extends StatelessWidget {
  final String name;
  final VoidCallback page;

  WidgetButton({required this.name, required this.page});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ElevatedButton(
      onPressed: page,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(name, style: TextStyle(fontSize: 16)),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(PURPLE_COLOR),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: PURPLE_COLOR)))),
    ));
  }
}
