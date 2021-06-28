import 'package:flutter/widgets.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:get/get.dart';

class WidgetAddNote extends StatelessWidget {
  const WidgetAddNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 10),
      child: Container(
        width: Get.width * 0.7,
        height: Get.height * 0.092,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: CICULAR_GREY_COLOR,
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 6),
              width: Get.width * 0.8,
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: PURPLE_COLOR,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: Get.width * 0.5,
                          child: Text(AppValues.TITLE_NOTE,
                              style: STYLE_LARGE,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                    Text('21/07/20', style: STYLE_MEDIUM),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.009,
            ),
            Container(
              width: Get.width * 0.8,
              child: Text(AppValues.NAME_NOTE,
                  maxLines: 2,
                  style: STYLE_SMALL,
                  overflow: TextOverflow.ellipsis),
            )
          ],
        ),
      ),
    );
  }
}
