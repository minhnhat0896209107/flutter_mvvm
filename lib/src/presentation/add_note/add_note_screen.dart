import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/utils/app_utils.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> with ResponsiveWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  Widget buildDesktop(BuildContext context) => SizedBox();

  @override
  Widget buildMobile(BuildContext context) => _buildBody();

  @override
  Widget buildTablet(BuildContext context) => _buildBody();
}

Widget _buildBody() {
  return Container(
    height: Get.height * 0.1,
    width: Get.width,
    margin: EdgeInsets.only(bottom: 10, left: 10, right: 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7), color: Colors.grey[200]),
    child: Column(
      children: [
        _title(),
        SizedBox(
          height: Get.height * 0.01,
        ),
        _writeNote(),
      ],
    ),
  );
}

Widget _title() {
  return Container(
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
                    style: STYLE_LARGE, overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
          Text('21/07/20', style: STYLE_MEDIUM),
        ],
      ),
    ),
  );
}

Widget _writeNote() {
  return Container(
    width: Get.width * 0.8,
    child: Align(
      alignment: Alignment.topLeft,
      child: Text(AppValues.NAME_NOTE,
          style: STYLE_SMALL, overflow: TextOverflow.ellipsis),
    ),
  );
}
