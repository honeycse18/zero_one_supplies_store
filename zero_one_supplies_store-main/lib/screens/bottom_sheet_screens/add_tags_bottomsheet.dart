import 'package:ecomikstoreapp/controller/add_tag_bottomsheet_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_text_styles.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AddTAgBottomSheet extends StatelessWidget {
  const AddTAgBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddTagBottomSheetController>(
      init: AddTagBottomSheetController(),
      builder: (controller) => SafeArea(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          child: Container(
              height: 320,
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                  color: AppColors.bottomSheetyColor,
                  border: Border.all(
                    width: 1.5,
                    color: AppColors.bottomSheetyColor,
                  )),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: controller.addTagKey,
                child: Column(
                  children: [
                    AppGaps.hGap10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Add New Tag',
                          style: AppTextStyles.headlineLargeSemiboldTextStyle,
                        ),
                        TightIconButtonWidget(
                          icon: Container(
                            height: 24,
                            width: 24,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6))),
                            child: SvgPicture.asset(
                              AppAssetImages.crossIconSVG,
                              color: Colors.black,
                            ),
                          ),
                          onTap: () {
                            Get.back();
                          },
                        ),
                      ],
                    ),
                    AppGaps.hGap10,
                    const DottedHorizontalLine(
                      dashColor: Color(0xFF3A416F),
                    ),
                    AppGaps.hGap32,
                    TextFormFieldWidget(
                      validator: controller.textFormValidator,
                      controller: controller.addTagController,
                      labelText: 'Tag Name',
                      hintText: 'Enter Your Tag Name',
                      minLines: 1,
                      maxLines: 1,
                    ),
                    AppGaps.hGap20,
                    Expanded(
                      child: CustomStretchedTextButtonWidget(
                        buttonText: 'Confirm Tag',
                        onTap: controller.onConfirmAddTagButtontap,
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
