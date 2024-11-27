import 'package:ecomikstoreapp/utils/constants/app_language_translations.dart';
import 'package:ecomikstoreapp/utils/extensions/string.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:ecomikstoreapp/utils/helpers/image_picker_helper.dart';
import 'package:ecomikstoreapp/widgets/dialogs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart' as image_picker;

class AddProduct2ndScreenController extends GetxController {
  ScrollController storeLogoImagesScrollController = ScrollController();
  RxList<Uint8List> storeLogoImages = <Uint8List>[].obs;
  String productImageURL = '';

  void processStoreLogoImages(List<image_picker.XFile> pickedImages) async {
    List<Uint8List> processedImages =
        await ImagePickerHelper.getProcessedImages(pickedImages);
    storeLogoImages.addAll(processedImages);
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
    update();
    Helper.scrollToEnd(storeLogoImagesScrollController);
  }

  void pickStoreLogoImages() async {
    final List<image_picker.XFile>? pickedImages =
        await ImagePickerHelper.getPhoneImages();
    if (pickedImages == null || pickedImages.isEmpty) {
      return;
    }
    processStoreLogoImages(pickedImages);
    AppDialogs.showProcessingDialog(
        message:
            AppLanguageTranslation.imageprocessingTransKey.toCurrentLanguage);
  }

  void onStoreLogoImageButtonTap() {
    pickStoreLogoImages();
  }
}
