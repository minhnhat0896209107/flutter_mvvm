import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/presentation/list_notebooks/list_notebooks_viewmodel.dart';
import 'package:flutter_app/src/presentation/presentation.dart';
import 'package:get/get.dart';

class ListNoteBooks extends StatefulWidget {
  const ListNoteBooks({Key? key}) : super(key: key);

  @override
  _ListNoteBooksState createState() => _ListNoteBooksState();
}

List<Color> _mycolors = <Color>[
  Colors.grey,
  Colors.red,
];
Color _primaryColors = _mycolors[0];

class _ListNoteBooksState extends State<ListNoteBooks> with ResponsiveWidget {
  late ListNoteBookViewModel _viewModel;
  late int index = 1;
  late bool check = false;
  @override
  Widget build(BuildContext context) {
    return BaseWidget<ListNoteBookViewModel>(
        builder: (context, viewModel, child) {
          return buildUi(context: context);
        },
        onViewModelReady: (viewModel) {
          _viewModel = viewModel!..init();
        },
        viewModel: ListNoteBookViewModel());
  }

  @override
  Widget buildDesktop(BuildContext context) => SizedBox();

  @override
  Widget buildMobile(BuildContext context) => _buildBody();

  @override
  Widget buildTablet(BuildContext context) => SizedBox();

  Widget _buildBody() {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: NestedScrollView(
          headerSliverBuilder: (context, isScrolled) {
            return [
              SliverAppBar(
                collapsedHeight: Get.height * 0.22,
                automaticallyImplyLeading: false,
                snap: true,
                floating: true,
                flexibleSpace: _notebookScreen(),
              )
            ];
          },
          body: Container(child: index == 1 ? _body() : _createNotebooks()),
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

  Widget _notebookScreen() {
    return Container(
        child: Column(
      children: [_appBar(), _head()],
    ));
  }

  Widget _body() {
    return Container(
        child: GridView.count(
            crossAxisCount: 3,
            padding: EdgeInsets.only(left: 13, right: 13, top: 15),
            childAspectRatio: 3 / 4.5,
            children: List.generate(
                20,
                (index) => check == false
                    ? Container(
                        child: WidgetNoteBooks(
                        name: 'Fun Plane',
                        color: Colors.blue,
                      ))
                    : Stack(children: [
                        Container(
                            child: WidgetNoteBooks(
                          name: 'Fun Plane',
                          color: Colors.blue,
                        )),
                        Container(
                            margin: EdgeInsets.only(left: 10),
                            child: buildIconBtn(_primaryColors))
                      ]))));
  }

  Widget _head() {
    TextEditingController search = TextEditingController();
    return Container(
      height: Get.height * 0.13,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: WidgetTextEdit(
                    name: 'NoteBooks', style: STYLE_VERY_LARGE_BOLD)),
            SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: Color(0xffE4E4E5)),
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
      height: Get.height * 0.09,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 20, 0),
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
                  )),
              Container(
                  child: check == false
                      ? GestureDetector(
                          child: Text('Edit',
                              style:
                                  TextStyle(fontSize: 17, color: PURPLE_COLOR)),
                          onTap: () {
                            setState(() {
                              check = true;
                            });
                          },
                        )
                      : GestureDetector(
                          child: Text('Done',
                              style:
                                  TextStyle(fontSize: 17, color: PURPLE_COLOR)),
                          onTap: () {
                            setState(() {
                              check = false;
                            });
                          },
                        )),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIconBtn(Color myColor) => Container(
        child: Stack(
          children: [
            // Positioned(
            //   top: 12.5,
            //   left: 12.5,
            //   child: Icon(Icons.check,
            //       size: 25,
            //       color:
            //           _primaryColors == myColor ? myColor : Colors.transparent),
            // ),
            IconButton(
              icon: Icon(
                Icons.circle,
                color: myColor.withOpacity(0.65),
                size: 30,
              ),
              onPressed: () {
                // ignore: unused_element
                setState() {
                  _primaryColors = myColor;
                }
              },
            ),
          ],
        ),
      );
}

Widget _createNotebooks() {
  return Container(
    margin: EdgeInsets.only(top: Get.height * 0.2),
    child: Column(
      children: [
        Icon(
          Icons.menu_book,
          color: Colors.grey,
          size: 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WidgetTextEdit(name: 'Let\'s create ', style: STYLE_LARGE),
            WidgetTextEdit(
                name: 'Note',
                style: STYLE_LARGE.copyWith(color: Colors.purple)),
            WidgetTextEdit(name: ' please', style: STYLE_LARGE),
          ],
        ),
      ],
    ),
  );
}
