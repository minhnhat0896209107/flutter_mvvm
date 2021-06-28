import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/configs/constanst/app_colors.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/presentation/browse/browse_viewmodel.dart';
import 'package:flutter_app/src/presentation/list_note/list_note.dart';
import 'package:flutter_app/src/presentation/presentation.dart';
import 'package:flutter_app/src/presentation/browse/dialog/dialog_create_notebook.dart';
import 'package:flutter_app/src/presentation/widgets/widget_notebook.dart';
import 'package:get/get.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({Key? key}) : super(key: key);

  @override
  _BrownScreenState createState() => _BrownScreenState();
}

class _BrownScreenState extends State<BrowseScreen> with ResponsiveWidget {
  late BrowseViewModel _viewModel;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BaseWidget<BrowseViewModel>(
      builder: (context, viewModel, child) {
        return buildUi(context: context);
      },
      viewModel: BrowseViewModel(),
      onViewModelReady: (viewModel) {
        _viewModel = viewModel!..init();
      },
    );
  }

  @override
  Widget buildDesktop(BuildContext context) => SizedBox();

  @override
  Widget buildMobile(BuildContext context) => _buildBody();

  @override
  Widget buildTablet(BuildContext context) => _buildBody();

  Widget _buildBody() {
    return Scaffold(
        body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                    automaticallyImplyLeading: false,
                    snap: true,
                    floating: true,
                    collapsedHeight: Get.height * 0.18,
                    flexibleSpace: browseScreen()),
              ];
            },
            body: SingleChildScrollView(
                physics: BouncingScrollPhysics(), child: _body())),
        floatingActionButton: new FloatingActionButton(
            elevation: 0.0,
            child: Container(
              height: 60,
              width: 60,
              child: Icon(
                Icons.add,
                size: 30,
                color: WHITE_COLOR.withOpacity(0.9),
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(0.8, 0.0),
                      colors: [Color(0xff3D0F54), Color(0xff7B1E58)])),
            ),
            onPressed: () {}));
  }

  Widget browseScreen() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
        child: Column(
          children: [
            _appBar(),
            _head(),
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _listImageNoteBook(),
            _listNote(),
          ],
        ),
      ),
    );
  }

  Widget _listNote() {
    return Container(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 10, 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _titleListNote(),
          _bodyListNote(),
        ],
      ),
    ));
  }

  Widget _bodyListNote() {
    return Container(
      child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
          child: Container(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    _viewModel.onPageDisplayNote();
                  },
                  child: Container(child: WidgetAddNote()),
                );
              },
            ),
          )),
    );
  }

  Widget _titleListNote() {
    return Container(
      height: Get.height * 0.04,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WidgetTextEdit(name: 'Notes', style: STYLE_LARGE_BOLD),
            WidgetTextEdit(
              name: 'Show All',
              style: STYLE_MEDIUM_BOLD.copyWith(color: PURPLE_COLOR),
              callback: () {
                _viewModel.onPageListNoteScreen();
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _listImageNoteBook() {
    return Container(
      height: Get.height * 0.3,
      child: Column(
        children: [_title(), _bodyNameListNote()],
      ),
    );
  }

  Widget _bodyNameListNote() {
    return Container(
      width: Get.width,
      height: Get.height * 0.23,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Container(
              child: InkWell(
                onTap: () {
                  _viewModel.showDialog();
                },
                child: Container(child: _createNoteBook()),
              ),
            );
          } else {
            // index - 1
            return Container(
                child: WidgetNoteBooks(
              color: Colors.blue,
              name: 'Fun plane',
              style: STYLE_MEDIUM_BOLD,
            ));
          }
        },
      ),
    );
  }

  Widget _title() {
    return Container(
      height: Get.height * 0.05,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WidgetTextEdit(
              name: 'Notebooks',
              style: STYLE_LARGE_BOLD,
            ),
            WidgetTextEdit(
              name: 'Show All',
              style: STYLE_MEDIUM_BOLD.copyWith(color: PURPLE_COLOR),
              callback: () {
                _viewModel.onPageListNotebookScreen();
              },
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
        padding: const EdgeInsets.fromLTRB(15, 10, 20, 5),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: WidgetTextEdit(
                  name: 'Browse',
                  style: STYLE_VERY_LARGE_BOLD,
                )),
            SizedBox(height: 11),
            Container(width: Get.width * 0.85, height: 0.1, color: BLACK_COLOR)
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return Container(
      height: Get.height * 0.08,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 20),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: InkWell(
              onTap: () {
                _viewModel.onPageSettingScreen();
              },
              child: WidgetSetting()),
        ),
      ),
    );
  }
}

Widget _createNoteBook() {
  return Container(
      child: Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 25, right: 15),
        child: Container(
          margin: EdgeInsets.only(top: Get.height * 0.008),
          child: DottedBorder(
            // color: CICULAR_GREY_COLOR,
            dashPattern: [6, 8, 0, 0],
            strokeWidth: 3,
            radius: Radius.circular(9),
            borderType: BorderType.RRect,
            child: Container(
              width: Get.width * 0.217,
              height: Get.height * 0.15,
              child: Icon(
                Icons.add_circle_outline,
                size: 30,
                color: PURPLE_COLOR,
              ),
            ),
          ),
        ),
      ),
      SizedBox(height: Get.height * 0.016),
      Container(
        width: Get.width * 0.2,
        margin: EdgeInsets.only(left: 20),
        child: WidgetTextEdit(
          name: AppValues.CREATE_NOTE,
          style: STYLE_MEDIUM_BOLD.copyWith(color: PURPLE_COLOR),
          color: PURPLE_COLOR,
        ),
      )
    ],
  ));
}
