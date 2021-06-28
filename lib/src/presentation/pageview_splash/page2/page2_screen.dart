import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:get/get.dart';

import '../../presentation.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: BACKGROUND_SPLASH,
      child: Stack(
        children: [_head(), _body()],
      ),
    );
  }
}

Widget _head() {
  return Container(
      height: Get.height * 1 / 2,
      child: Center(child: Image.asset(AppImages.img_wave_form)));
}

Widget _body() {
  return Stack(
    children: [
      Expanded(
        child: Container(
            child: CustomPaint(
          painter: ShapePainter1(),
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
    title: AppValues.INPUT_SPEECH, name: AppValues.INPUT_NAME_SPEECH);

class ShapePainter1 extends CustomPainter {
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
        size.width / 2, size.height / 2.5, size.width, size.height / 2);
    path.lineTo(size.width, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
