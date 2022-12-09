import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_guide_book_getx/model/guide_book_model.dart';

class AppController extends GetxController {
  var guide = [].obs;
  RxBool isDark = false.obs;
  
  addGuide(GuideModel model) {
    guide.add(model);
    Get.back();
  }

  deleteGuide(GuideModel model) {
    guide.remove(model);
  }

  temaDegistir() {
    isDark.value = !isDark.value;
    isDark.value
        ? Get.changeTheme(ThemeData.dark())
        : Get.changeTheme(ThemeData.light());
  }
}
