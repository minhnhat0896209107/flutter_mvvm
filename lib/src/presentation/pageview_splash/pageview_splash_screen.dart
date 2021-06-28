import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/pageview_splash/page3/page3_screen.dart';
import 'package:flutter_app/src/presentation/presentation.dart';
import 'package:flutter_app/src/presentation/widgets/widget_circle_splash.dart';
import 'package:flutter_app/src/presentation/widgets/widget_skip_splash.dart';

import 'package:flutter_app/src/presentation/widgets/widgets_bottom.dart';
import 'package:get/get.dart';

class PageViewSplash extends StatefulWidget {
  const PageViewSplash({Key? key}) : super(key: key);

  @override
  _PageViewSplashState createState() => _PageViewSplashState();
}

class _PageViewSplashState extends State<PageViewSplash> with ResponsiveWidget {
  late PageViewSplashViewModel _viewModel;

  PageController _pageController = PageController();
  int _currentTab = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<PageViewSplashViewModel>(
      builder: (context, viewModel, child) {
        return buildUi(context: context);
      },
      viewModel: PageViewSplashViewModel(),
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
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [Page1(), Page2(), Page3()],
            onPageChanged: (value) {
              setState(() {
                _currentTab = value;
              });
            },
          ),
          Padding(
            padding: EdgeInsets.only(bottom: Get.height * 0.06),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    child: WidgetSkipSplash(name: 'Skip'),
                    onTap: () {
                      _viewModel.onPageBrowse();
                    },
                  ),
                  WidgetCircleSplash(index: _currentTab),
                  WidgetButton(
                      name: 'Next',
                      page: () {
                        if (_pageController.hasClients) {
                          _pageController.animateToPage(_currentTab + 1,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeIn);
                          if (_currentTab >= 2) {
                            _viewModel.onPageBrowse();
                          }
                        }
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
