import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/configs/configs.dart';

class WidgetTextSplash extends StatelessWidget {
  final String title;
  final String name;

  WidgetTextSplash({required this.title, required this.name});
  @override
  Widget build(BuildContext context) => Container(
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                  color: PURPLE_COLOR,
                  fontSize: 26,
                  fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: TEXT_NAME_COLOR,
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
