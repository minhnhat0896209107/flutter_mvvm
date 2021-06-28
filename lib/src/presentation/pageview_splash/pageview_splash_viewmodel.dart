import 'package:flutter_app/src/presentation/base/base.dart';
import '../presentation.dart';
import 'package:get/get.dart';

class PageViewSplashViewModel extends BaseViewModel {
  init() async {}

  onPageBrowse() {
    Get.toNamed(Routers.browsescreen);
  }
}
