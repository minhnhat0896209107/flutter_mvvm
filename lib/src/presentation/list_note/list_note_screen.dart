import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/configs/constanst/app_values.dart';
import 'package:flutter_app/src/presentation/base/base_widget.dart';
import 'package:flutter_app/src/presentation/list_note/display_note/display_note.dart';
import 'package:flutter_app/src/presentation/list_note/list_note_viewmodel.dart';
import 'package:get/get.dart';

import '../presentation.dart';

class ListNoteScreen extends StatefulWidget {
  const ListNoteScreen({Key? key}) : super(key: key);

  @override
  _ListNoteScreenState createState() => _ListNoteScreenState();
}

class _ListNoteScreenState extends State<ListNoteScreen> with ResponsiveWidget {
  late ListNoteViewModel _viewModel;
  late bool check = false;
  @override
  Widget build(BuildContext context) {
    return BaseWidget<ListNoteViewModel>(
        builder: (context, viewModel, child) {
          return buildUi(context: context);
        },
        onViewModelReady: (viewModel) {
          _viewModel = viewModel!..init();
        },
        viewModel: ListNoteViewModel());
  }

  @override
  Widget buildDesktop(BuildContext context) => SizedBox();

  @override
  Widget buildMobile(BuildContext context) => _buildBody();

  @override
  Widget buildTablet(BuildContext context) => _buildBody();

  Widget _buildBody() {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                snap: true,
                floating: true,
                collapsedHeight: Get.height * 0.25,
                automaticallyImplyLeading: false,
                flexibleSpace: _noteScreen(),
              )
            ];
          },
          body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(child: _body())),
        ),
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

  Widget _noteScreen() {
    return Container(
      child: Column(
        children: [_appBar(), _head()],
      ),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 15, 0),
            child: Container(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      child: InkWell(
                          onTap: () {
                            _viewModel.onPageDisplayNote();
                          },
                          child: WidgetAddNote()));
                },
              ),
            )),
      ),
    );
  }

  Widget _head() {
    TextEditingController search = TextEditingController();
    return Container(
      height: Get.height * 0.132,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: WidgetTextEdit(
                    name: 'Shakespeare', style: STYLE_VERY_LARGE_BOLD)),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9), color: SEARCH_COLOR),
              height: Get.height * 0.06,
              child: TextField(
                controller: search,
                style: STYLE_LARGE,
                decoration: InputDecoration(
                  hintText: 'Search',
                  enabledBorder: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return Container(
      height: Get.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 25, 0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    _viewModel.onBackHome();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: PURPLE_COLOR,
                    size: 30,
                  )),
              Container(
                  child: check == false
                      ? InkWell(
                          child: WidgetTextEdit(
                              name: "Edit",
                              style:
                                  TextStyle(fontSize: 17, color: PURPLE_COLOR)),
                          onTap: () {
                            setState(() {
                              check = true;
                            });
                          },
                        )
                      : InkWell(
                          child: WidgetTextEdit(
                              name: "Done",
                              style:
                                  TextStyle(fontSize: 17, color: PURPLE_COLOR)),
                          onTap: () {
                            setState(() {
                              check = false;
                            });
                          },
                        ))
            ],
          ),
        ),
      ),
    );
  }
}
