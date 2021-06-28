import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:get/get.dart';

import '../../presentation.dart';

class Page3 extends StatelessWidget {
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
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          AppImages.img_book,
          width: 100,
          height: 150,
        ),
        Image.asset(
          AppImages.img_notebook,
          width: 100,
          height: 150,
        ),
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
            _buildText2()
          ],
        ),
      ),
    ],
  );
}

Widget _buildText2() => WidgetTextSplash(
    title: AppValues.INPUT_ADD_NOTE, name: AppValues.INPUT_NAME_ADD_NOTE);

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
