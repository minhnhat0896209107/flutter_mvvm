import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/presentation.dart';
import 'package:flutter_app/src/presentation/widgets/widget_text_edit_start.dart';
import 'package:flutter_app/src/presentation/widgets/widgets_bottom.dart';
import 'package:get/get.dart';

class DialogCreateStar extends StatefulWidget {
  const DialogCreateStar({Key? key}) : super(key: key);

  @override
  _DialogCreateStarState createState() => _DialogCreateStarState();
}

class _DialogCreateStarState extends State<DialogCreateStar> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Container(
          height: Get.height * 0.4,
          child: Column(
            children: [
              Container(
                child: Image.asset(
                  'assets/images/smile.png',
                  width: Get.width * 0.3,
                ),
              ),
              SizedBox(height: 5),
              WidgetTextEdit(name: 'Help us please :)', style: STYLE_LARGE),
              SizedBox(height: 10),
              WidgetTextEditStart(
                  name: AppValues.TEXT_SETTING, style: STYLE_MEDIUM),
              WidgetButton(name: 'Raise Us', page: () {}),
              SizedBox(height: 5),
              WidgetButton(name: 'Give Feedback', page: () {})
            ],
          ),
        ),
      ),
    );
  }
}
