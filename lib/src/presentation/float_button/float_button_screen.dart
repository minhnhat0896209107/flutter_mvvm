import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/presentation/presentation.dart';
import 'package:get/get.dart';

class FloatButtonScreen extends StatefulWidget {
  const FloatButtonScreen({Key? key}) : super(key: key);

  @override
  _FloatButtonScreenState createState() => _FloatButtonScreenState();
}

class _FloatButtonScreenState extends State<FloatButtonScreen>
    with ResponsiveWidget {
  late FloatButtonScreen _viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseWidget<FloatButtonViewModel>(
        builder: (context, viewModel, child) {
          return buildUi(context: context);
        },
        onViewModelReady: (viewModel) {
          _viewModel = viewModel?.init();
        },
        viewModel: FloatButtonViewModel());
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
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              snap: true,
              floating: true,
              flexibleSpace: _appBar(),
            )
          ];
        },
        body: Container(),
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
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: PURPLE_COLOR,
                    size: 30,
                  )),
              Container(
                  child: InkWell(
                child: WidgetTextEdit(
                    name: "Save",
                    style: TextStyle(fontSize: 17, color: PURPLE_COLOR)),
                onTap: () {
                  setState(() {});
                },
              )),
              Row(
                children: [
                  Icon(
                    Icons.timer,
                    size: 20,
                    color: PURPLE_COLOR,
                  ),
                  SizedBox(
                    width: Get.width * 0.02,
                  ),
                  Text('21/07/20',
                      style: STYLE_SMALL.copyWith(color: PURPLE_COLOR))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
