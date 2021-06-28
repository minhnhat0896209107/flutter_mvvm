import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:get/get.dart';

import '../../presentation.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: BACKGROUND_SPLASH,
        child: Stack(
          children: [_head(), _body()],
        ),
      );
}

Widget _head() {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              Image.asset(AppImages.imgBook1, width: 100, height: 130),
              Image.asset(AppImages.imgBook2, width: 100, height: 130),
              Image.asset(AppImages.imgBook3, width: 100, height: 130),
            ],
          ),
        ),
        Column(
          children: [
            Image.asset(AppImages.imgBook4, width: 100, height: 130),
            Image.asset(AppImages.imgBook5, width: 100, height: 130),
            Image.asset(AppImages.imgBook6, width: 100, height: 130),
            Image.asset(AppImages.imgBook7, width: 100, height: 130),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              Image.asset(AppImages.imgBook8, width: 100, height: 130),
              Image.asset(AppImages.imgBook9, width: 100, height: 130),
              Image.asset(AppImages.imgBook10, width: 100, height: 130),
            ],
          ),
        )
      ],
    ),
  );
}

Widget _body() {
  return Stack(
    children: [
      Expanded(
        child: Container(
            child: CustomPaint(
          painter: ShapePainter(),
          child: Container(),
        )),
      ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height * 1 / 4,
            ),
            _buildText()
          ],
        ),
      ),
    ],
  );
}

Widget _buildText() => WidgetTextSplash(
    title: AppValues.INPUT_NOTEBOOK, name: AppValues.INPUT_NAME_NOTEBOOK);

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = WHITE_COLOR
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height / 2);
    path.quadraticBezierTo(
        size.width / 2, size.height / 1.7, size.width, size.height / 2);
    path.lineTo(size.width, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
