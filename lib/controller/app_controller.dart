import 'package:get/get.dart';
import 'package:phone_guide_book_getx/model/guide_book_model.dart';

class AppController extends GetxController {
  var guide = [].obs;
  addGuide(GuideModel value) {
    guide.add(value);
    Get.back();
  }

  deleteGuide(GuideModel value) {
    guide.remove(value);
  }
}
