import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/presentation/base/base.dart';
import 'package:get/get.dart';
import '../presentation.dart';

class BrowseViewModel extends BaseViewModel {
  final TextEditingController nameOfNote = TextEditingController();
  init() async {}

  onPageListNoteScreen() {
    Get.toNamed(Routers.listnote);
  }

  onPageListNotebookScreen() {
    Get.toNamed(Routers.listnotebook);
  }

  onPageSettingScreen() {
    Get.toNamed(Routers.setting);
  }

  onPageDisplayNote() {
    Get.toNamed(Routers.display);
  }

  onPageFloat() {
    Get.toNamed(Routers.float_button);
  }

  void showDialog() {
    Get.dialog(DialogCreateNoteBook(
      controller: nameOfNote,
    ));
  }
}
