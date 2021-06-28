import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:flutter_app/src/presentation/presentation.dart';
import 'package:get/get.dart';

class ListNoteViewModel extends BaseViewModel {
  init() async {}
  onBackHome() {
    Get.back();
  }

  onPageDisplayNote() {
    Get.toNamed(Routers.display);
  }
}
