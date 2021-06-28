import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../presentation.dart';

class WidgetTextSetting extends StatelessWidget {
  final String name;
  final String nameLanguage;
  final double size;
  final Color color;
  final VoidCallback? callBack;

  WidgetTextSetting({
    Key? key,
    required this.name,
    required this.nameLanguage,
    required this.size,
    required this.color,
    this.callBack,
  }) : super(key: key);
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
            Row(
              children: [
                Text(
                  nameLanguage,
                  style: TextStyle(color: color, fontSize: size),
                ),
                IconButton(
                    onPressed: callBack, icon: Icon(Icons.arrow_forward_ios))
              ],
            ),
          ],
        ),
      );
}
