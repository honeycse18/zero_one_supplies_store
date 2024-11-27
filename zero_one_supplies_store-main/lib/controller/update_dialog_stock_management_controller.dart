import 'package:get/get.dart';

class UpdateDialogScreenController extends GetxController {
  int productCount = 0;
  bool? stockQuantityType;
  @override
  void onInit() {
    try {
      productCount = Get.find<int>(tag: 'productCount');
      Get.delete<int>(tag: 'productCount');
    } on Exception {}
    super.onInit();
  }
}
