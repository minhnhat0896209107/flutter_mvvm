import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/presentation.dart';
import 'package:flutter_app/src/presentation/widgets/widget_text_edit_start.dart';
import 'package:flutter_app/src/utils/app_utils.dart';
import 'package:get/get.dart';

class DisplayNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                snap: true,
                floating: true,
                collapsedHeight: Get.height * 0.15,
                flexibleSpace: _appBar(),
              )
            ];
          },
          body: Container(
            child: Column(
              children: [_head(), _body()],
            ),
          ),
        ),
      );

  Widget _appBar() {
    DateTime now = new DateTime.now();
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 40, 10, 0),
        height: Get.height * 0.15,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back_ios,
                      color: Colors.purple, size: 30),
                ),
                Icon(
                  Icons.ios_share,
                  size: 30,
                  color: PURPLE_COLOR,
                )
              ],
            ),
            SizedBox(height: Get.height * 0.02),
            Row(
              children: [
                Icon(
                  Icons.timer,
                  size: 20,
                  color: PURPLE_COLOR,
                ),
                SizedBox(
                  width: Get.width * 0.02,
                ),
                Text('21/07/20',
                    style: STYLE_SMALL.copyWith(color: PURPLE_COLOR))
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget _head() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
    child: Container(
      height: Get.height * 0.35,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetTextEdit(name: 'Space', style: STYLE_VERY_LARGE),
          SizedBox(height: Get.height * 0.01),
          WidgetTextEditStart(
              name:
                  'Sanfran Was one of the coolest places I have ever been all the beautiful signseei....',
              style: STYLE_LARGE),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImages.imgBook1),
              Image.asset(AppImages.imgBook10)
            ],
          )
        ],
      ),
    ),
  );
}

Widget _body() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
    child: Container(
      height: Get.height * 0.35,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetTextEdit(name: 'Odyssey', style: STYLE_VERY_LARGE),
          SizedBox(height: Get.height * 0.01),
          WidgetTextEditStart(
              name:
                  'Sanfran Was one of the coolest places I have ever been all the beautiful signseei....',
              style: STYLE_LARGE),
        ],
      ),
    ),
  );
}
