import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:get/get.dart';

class WidgetNoteBooks extends StatelessWidget {
  final String name;
  final Color? color;
  final TextStyle? style;
  WidgetNoteBooks({Key? key, required this.name, this.color, this.style})
      : super(key: key);
  @override
  Widget build(BuildContext context) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 5),
            child: Container(
              height: Get.height * 0.17,
              width: Get.width * 0.26,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: color,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft * 0.7,
                    child: Image.asset(AppImages.img_dot),
                  ),
                  SizedBox(
                    width: Get.width * 0.12,
                  ),
                  Image.asset(AppImages.img_rectangle,
                      height: Get.height * 0.17, fit: BoxFit.cover),
                ],
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.015,
          ),
          Center(
            child: Text(
              name,
              style: style,
            ),
          )
        ],
      );
}
