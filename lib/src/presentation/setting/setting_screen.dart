import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/presentation/presentation.dart';
import 'package:flutter_app/src/presentation/setting/dialog_create_star/dialog_create_star.dart';
import 'package:flutter_app/src/presentation/widgets/widget_switch_setting.dart';
import 'package:flutter_app/src/presentation/widgets/widget_text_setting.dart';
import 'package:get/get.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> with ResponsiveWidget {
  late SettingViewModel _viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseWidget<SettingViewModel>(
        builder: (context, viewModel, child) {
          return buildUi(context: context);
        },
        onViewModelReady: (viewModel) {
          _viewModel = viewModel!..init();
        },
        viewModel: SettingViewModel());
  }

  @override
  Widget buildDesktop(BuildContext context) => SizedBox();

  @override
  Widget buildMobile(BuildContext context) => _buildBody();

  @override
  Widget buildTablet(BuildContext context) => SizedBox();
}

Widget _buildBody() {
  return Scaffold(
    body: SingleChildScrollView(
      child: Column(
        children: [
          _appBar(),
          _head(),
          _body(),
        ],
      ),
    ),
  );
}

Widget _body() {
  return Container(
    height: Get.height * 0.85,
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: WidgetTextEdit(
              name: 'Note List Sorting',
              style: STYLE_LARGE,
            ),
          ),
          SizedBox(height: 10),
          WidgetTextSetting(
              name: 'Language',
              nameLanguage: 'English',
              size: 15,
              color: Colors.grey,
              callBack: () {}),
          SizedBox(
            height: 10,
          ),
          WidgetTextSetting(
              name: 'Line Width',
              nameLanguage: '2.3',
              size: 15,
              color: Colors.grey,
              callBack: () {}),
          SizedBox(
            height: 10,
          ),
          WidgetTextSwitch(name: 'Reminders'),
          SizedBox(
            height: 10,
          ),
          WidgetTextSetting(
              name: 'Line Width',
              nameLanguage: '2.3',
              size: 15,
              color: Colors.grey,
              callBack: () {}),
          SizedBox(height: 30),
          Align(
            alignment: Alignment.topLeft,
            child: WidgetTextEdit(
              name: 'Note List Sorting',
              style: STYLE_LARGE,
            ),
          ),
          SizedBox(height: 10),
          WidgetTextSetting(
              name: 'Language',
              nameLanguage: 'English',
              size: 15,
              color: Colors.grey,
              callBack: () {}),
          SizedBox(
            height: 10,
          ),
          WidgetTextSetting(
              name: 'Line Width',
              nameLanguage: '2.3',
              size: 15,
              color: Colors.grey,
              callBack: () {}),
          SizedBox(
            height: 10,
          ),
          WidgetTextSwitch(name: 'Reminders'),
          SizedBox(
            height: 10,
          ),
          WidgetTextSetting(
              name: 'Line Width',
              nameLanguage: '2.3',
              size: 15,
              color: Colors.grey,
              callBack: () {}),
          SizedBox(
            height: 20,
          ),
          Container(
            width: Get.width * 0.8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.blue),
            height: Get.height * 0.07,
            child: Center(
              child: WidgetTextEdit(
                name: 'Subcribe\nNow',
                style: STYLE_MEDIUM.copyWith(color: WHITE_COLOR),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget _head() {
  return Container(
    height: Get.height * 0.1,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: WidgetTextEdit(
              name: 'Settings',
              style: STYLE_VERY_LARGE_BOLD,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _appBar() {
  return Container(
    height: Get.height * 0.1,
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: PURPLE_COLOR,
                )),
            IconButton(
                onPressed: () {
                  Get.dialog(DialogCreateStar());
                },
                icon: Icon(Icons.star, color: Colors.amber, size: 30))
          ],
        ),
      ),
    ),
  );
}
