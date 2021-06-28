import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:get/get.dart';

import '../../presentation.dart';

List<Color> mycolors = <Color>[
  Color(0xff3023AE),
  Color(0xffB4EC51),
  Color(0xffF5515F),
  Color(0xffFAD961),
  Color(0xff7CB3FC),
  Color(0xff343F3F),
  Color(0xffAE2369),
  Color(0xff0D1A2C),
];
Color primaryColor = mycolors[0];

class DialogCreateNoteBook extends StatefulWidget {
  final TextEditingController controller;
  const DialogCreateNoteBook({Key? key, required this.controller})
      : super(key: key);

  @override
  _DialogCreateNoteBookState createState() => _DialogCreateNoteBookState();
}

class _DialogCreateNoteBookState extends State<DialogCreateNoteBook> {
  @override
  void initState() {
    widget.controller.text = "hello";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white.withOpacity(0.8),
      body: Container(
        height: Get.height,
        child: Column(
          children: [_head(), _body()],
        ),
      ),
    );
  }

  // Xử lý hình ảnh

  Widget _body() {
    return Container(
      height: Get.height * 0.4448,
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.07,
          ),
          ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                )),
                backgroundColor: MaterialStateProperty.all<Color>(PURPLE_COLOR),
              ),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: WidgetTextEdit(
                  name: 'Save',
                  style: STYLE_MEDIUM,
                  callback: () {
                    Get.to(BrowseScreen());
                  },
                ),
              )),
          SizedBox(
            height: Get.height * 0.05,
          ),
          Container(
            width: Get.width * 0.8,
            height: Get.height * 0.25,
            child: buildColorIcons(),
            decoration: BoxDecoration(
              color: WHITE_COLOR,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _head() {
    return Container(
        height: Get.height * 0.5,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                    child: WidgetTextEdit(
                  name: 'cancel',
                  style: STYLE_MEDIUM_BOLD.copyWith(color: PURPLE_COLOR),
                  callback: () {
                    Get.back();
                  },
                ))),
          ),
          SizedBox(
            height: Get.height * 0.1,
          ),
          Align(
            alignment: Alignment.center,
            child: buildImage(),
          ),
          SizedBox(height: 5),
          Container(
            width: Get.width * 0.25,
            height: Get.height * 0.1,
            child: TextField(
                textAlign: TextAlign.center,
                style: STYLE_LARGE,
                controller: widget.controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                )),
          ),
        ]));
  }

  Widget buildImage() => Container(
        height: Get.height * 0.2,
        width: Get.width * 0.27,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: primaryColor,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Align(
              alignment: Alignment.bottomLeft * 0.8,
              child: Image.asset(AppImages.img_dot),
            ),
            SizedBox(
              width: Get.width * 0.12,
            ),
            Image.asset(AppImages.img_rectangle,
                height: Get.height * 0.2, fit: BoxFit.cover),
          ],
        ),
      );
  Widget buildColorIcons() {
    return Expanded(
      child: Container(
        height: Get.height * 0.2,
        child: Center(
          child: Padding(
              padding: const EdgeInsets.all(30),
              child: GridView(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 50,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15),
                  children: [
                    Container(child: buildIconBtn(mycolors[0])),
                    Container(child: buildIconBtn(mycolors[1])),
                    Container(child: buildIconBtn(mycolors[2])),
                    Container(child: buildIconBtn(mycolors[3])),
                    Container(child: buildIconBtn(mycolors[4])),
                    Container(child: buildIconBtn(mycolors[5])),
                    Container(child: buildIconBtn(mycolors[6])),
                    Container(child: buildIconBtn(mycolors[7])),
                  ])),
        ),
      ),
    );
  }

  // Click colorIcon thì thay đổi hình ảnh
  Widget buildIconBtn(Color myColor) => Container(
        child: Stack(
          children: [
            IconButton(
              icon: Icon(
                Icons.circle,
                color: myColor.withOpacity(0.65),
                size: 40,
              ),
              onPressed: () {
                setState(() {
                  primaryColor = myColor;
                });
              },
            ),
          ],
        ),
      );
}
