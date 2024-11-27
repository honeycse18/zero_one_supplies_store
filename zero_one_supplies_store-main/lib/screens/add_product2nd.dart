import 'package:ecomikstoreapp/controller/add_product_second_screen_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:ecomikstoreapp/widgets/screen_widgets/add_product_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductSecondScreen extends StatelessWidget {
  const AddProductSecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductSecondScreenController>(
        init: AddProductSecondScreenController(),
        builder: (controller) => DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: Image.asset(AppAssetImages.backgroundScreen).image,
                      fit: BoxFit.fill)),
              child: Scaffold(
                /* <-------- Appbar --------> */
                appBar: CoreWidgets.appBarWidget(
                    screenContext: context,
                    hasBackButton: true,
                    titleWidget: Text(controller.appbarTitle)),
                /* <-------- Content --------> */
                body: CustomScaffoldBodyWidget(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // CircleAvatar(
                        //   backgroundImage: Image.asset(
                        //     AppAssetImages.myAccountProfilePicture,
                        //   ).image,
                        //   radius: 64,
                        // ),
                        // Top extra spaces
                        AppGaps.hGap15,
                        /* <---- Product picture ----> */
                        Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SectionHeaderTextWidget(
                                  text: LanguageHelper.currentLanguageText(
                                      LanguageHelper.statusTransKey)),
                              /* Row(
                                children: [
                                  Text(
                                      LanguageHelper.currentLanguageText(
                                          LanguageHelper.itemImageTransKey),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium
                                          ?.copyWith(color: Colors.black)),
                                ],
                              ),
                              AppGaps.hGap24,
                              CustomScaffoldBottomBarWidget(
                                  child: CustomStretchedTextButtonWidget(
                                buttonText: LanguageHelper.currentLanguageText(
                                    LanguageHelper.uploadTransKey),
                                onTap: () {},
                              )),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomTightTextButtonWidget(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Text(
                                        LanguageHelper.currentLanguageText(
                                            LanguageHelper
                                                .addMoreImageTransKey),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color: AppColors.primaryColor)),
                                  )
                                ],
                              ), */

                              /* <---- Edit Date ----> */
                              // CustomTextFormField(
                              //     labelText: 'Start date*',
                              //     hintText: '  2/11/21  ',
                              //     prefixIcon: SvgPicture.asset(
                              //         AppAssetImages.calenderSVGLogoLine)),
                              // AppGaps.hGap24,
                              // CustomTextFormField(
                              //     labelText: 'End date*',
                              //     hintText: '  2/11/21  ',
                              //     prefixIcon: SvgPicture.asset(
                              //         AppAssetImages.calenderSVGLogoLine)),
/* Container(
                            height: 126,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(18))),
                            child: Obx(() => ListView.separated(
                                scrollDirection: Axis.horizontal,
                                controller:
                                    controller.storeLogoImagesScrollController,
                                itemBuilder: (context, index) {
                                  if (index ==
                                      controller.storeLogoImages.length) {
                                    return SelectImageButton(
                                        onTap: controller
                                            .onStoreLogoImageButtonTap);
                                  }
                                  Uint8List selectedImageByte =
                                      controller.storeLogoImages[index];
                                  return SelectedImageWidget(
                                    selectedImageByte: selectedImageByte,
                                    onCrossButtonTap: () {
                                      controller.storeLogoImages
                                          .removeAt(index);
                                    },
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    AppGaps.wGap10,
                                itemCount:
                                    controller.storeLogoImages.length + 1)),
                          ) */
                              AppGaps.hGap16,
                              /* <---- Edit your email address ----> */
/*                               ToggleRowWidget(
                                label: LanguageHelper.currentLanguageText(
                                    LanguageHelper.availableStockTransKey),
                                value: controller.isAvailableToStock,
                                onToggle: (value) {
                                  controller.isAvailableToStock = value;
                                  controller.update();
                                },
                              ),
                              AppGaps.hGap24, */
/*                               ToggleRowWidget(
                                label: LanguageHelper.currentLanguageText(
                                    LanguageHelper.showStockTransKey),
                                value: controller.showStock,
                                onToggle: (value) {
                                  controller.showStock = value;
                                  controller.update();
                                },
                              ), */
                              AppGaps.hGap24,
                              /* CustomTextFormField(
                                isReadOnly: true,
                                labelText: LanguageHelper.currentLanguageText(
                                    LanguageHelper.colorTransKey),
                                hintText: 'Choose Color',
                                // prefixIcon: SvgPicture.asset(
                                //     AppAssetImages.calenderSVGLogoLine,
                                //     color: AppColors.bodyTextColor),
                                suffixIcon: PopupMenuButton<int>(
                                    padding: const EdgeInsets.only(right: 5),
                                    position: PopupMenuPosition.under,
                                    child: CustomIconButtonWidget(
                                      fixedSize: const Size(20, 20),
                                      child: SvgPicture.asset(
                                          AppAssetImages.arrowDownSVGLogoLine,
                                          height: 12,
                                          color: AppColors.bodyTextColor),
                                    ),
                                    itemBuilder: (context) => [
                                          const PopupMenuItem<int>(
                                            value: 0,
                                            child: Text(
                                              'Orange',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          const PopupMenuItem<int>(
                                            value: 1,
                                            child: Text(
                                              'Red',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          const PopupMenuItem<int>(
                                            value: 2,
                                            child: Text(
                                              'Black',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          const PopupMenuItem<int>(
                                            value: 3,
                                            child: Text(
                                              'Blue',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ]),
                              ), */
                              /* <---- Edit your email address ----> */
                              /* CustomTextFormField(
                                isReadOnly: true,
                                labelText: LanguageHelper.currentLanguageText(
                                    LanguageHelper.sizeTransKey),
                                hintText: 'Choose Size',
                                // prefixIcon: SvgPicture.asset(
                                //     AppAssetImages.calenderSVGLogoLine,
                                //     color: AppColors.bodyTextColor),
                                suffixIcon: PopupMenuButton<int>(
                                    padding: const EdgeInsets.only(right: 5),
                                    position: PopupMenuPosition.under,
                                    child: CustomIconButtonWidget(
                                      fixedSize: const Size(20, 20),
                                      child: SvgPicture.asset(
                                          AppAssetImages.arrowDownSVGLogoLine,
                                          height: 12,
                                          color: AppColors.bodyTextColor),
                                    ),
                                    itemBuilder: (context) => [
                                          const PopupMenuItem<int>(
                                            value: 0,
                                            child: Text(
                                              'Orange',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          const PopupMenuItem<int>(
                                            value: 1,
                                            child: Text(
                                              'Red',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          const PopupMenuItem<int>(
                                            value: 2,
                                            child: Text(
                                              'Black',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          const PopupMenuItem<int>(
                                            value: 3,
                                            child: Text(
                                              'Blue',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ]),
                              ), */
                              /* ToggleRowWidget(
                                label: LanguageHelper.currentLanguageText(
                                    LanguageHelper.flashSellTransKey),
                                value: controller.isFlashSell,
                                onToggle: (value) {
                                  controller.isFlashSell = value;
                                  controller.update();
                                },
                              ),
                              AppGaps.hGap24, */
                              ToggleRowWidget(
                                label: LanguageHelper.currentLanguageText(
                                    LanguageHelper.stockAvailableTransKey),
                                value: controller.isAvailableToStock,
                                onToggle: (value) {
                                  controller.isAvailableToStock = value;
                                  controller.update();
                                  controller.updateDraft();
                                },
                              ),
                              AppGaps.hGap24,
                              ToggleRowWidget(
                                label: LanguageHelper.currentLanguageText(
                                    LanguageHelper.stockVisibilityTransKey),
                                value: controller.showStock,
                                onToggle: (value) {
                                  controller.showStock = value;
                                  controller.update();
                                  controller.updateDraft();
                                },
                              ),
                              AppGaps.hGap24,
                              ToggleRowWidget(
                                label: LanguageHelper.currentLanguageText(
                                    LanguageHelper.productActiveStatusTransKey),
                                value: controller.isProductActiveStatus,
                                onToggle: (value) {
                                  controller.isProductActiveStatus = value;
                                  controller.update();
                                  controller.updateDraft();
                                },
                              ),
                              AppGaps.hGap24,
                              // AppGaps.hGap24,
                              // ToggleRowWidget(
                              //   label: LanguageHelper.currentLanguageText(
                              //       LanguageHelper.noveltyTransKey),
                              //   value: controller.isNovelty,
                              //   onToggle: (value) {
                              //     controller.isNovelty = value;
                              //     controller.update();
                              //   },
                              // ),
                              // AppGaps.hGap24,
                              // ToggleRowWidget(
                              //   label: LanguageHelper.currentLanguageText(
                              //       LanguageHelper.onSellTransKey),
                              //   value: controller.isOnSell,
                              //   onToggle: (value) {
                              //     controller.isOnSell = value;
                              //     controller.update();
                              //   },
                              // ),
                              // AppGaps.hGap24,
                              // ToggleRowWidget(
                              //   label: LanguageHelper.currentLanguageText(
                              //       LanguageHelper.bestSaleTransKey),
                              //   value: controller.isBestSell,
                              //   onToggle: (value) {
                              //     controller.isBestSell = value;
                              //     controller.update();
                              //   },
                              // ),
                              // AppGaps.hGap24,
                              // ToggleRowWidget(
                              //   label: LanguageHelper.currentLanguageText(
                              //       LanguageHelper.topSaleTransKey),
                              //   value: controller.isTopSell,
                              //   onToggle: (value) {
                              //     controller.isTopSell = value;
                              //     controller.update();
                              //   },
                              // ),
                              // AppGaps.hGap24,
/*                               ToggleRowWidget(
                                label: LanguageHelper.currentLanguageText(
                                    LanguageHelper.featuredTransKey),
                                value: controller.isFeatured,
                                onToggle: (value) {
                                  controller.isFeatured = value;
                                  controller.update();
                                },
                              ),
                              AppGaps.hGap24, */
                              // ToggleRowWidget(
                              //   label: LanguageHelper.currentLanguageText(
                              //       LanguageHelper.popularTransKey),
                              //   value: controller.isPopular,
                              //   onToggle: (value) {
                              //     controller.isPopular = value;
                              //     controller.update();
                              //   },
                              // ),
/*                               AppGaps.hGap24,
                              ToggleRowWidget(
                                label: LanguageHelper.currentLanguageText(
                                    LanguageHelper.productActiveStatusTransKey),
                                value: controller.isProductActiveStatus,
                                onToggle: (value) {
                                  controller.isProductActiveStatus = value;
                                  controller.update();
                                },
                              ), */

                              /* AppGaps.hGap16,
                              SingleImageUploadSectionWidget(
                                  label: LanguageHelper.currentLanguageText(
                                      LanguageHelper.productImageTransKey),
                                  imageURL: controller.productImageURL,
                                  onImageUploadTap:
                                      controller.onUploadProductImageTap),
                              AppGaps.hGap24,
                              SingleImageUploadSectionWidget(
                                  label: LanguageHelper.currentLanguageText(
                                      LanguageHelper.thumbnailImageTransKey),
                                  imageURL: controller.thumbnailImageURL,
                                  onImageUploadTap:
                                      controller.onUploadThumbnailImageTap),
                              AppGaps.hGap24,
                              MultiImageUploadSectionWidget(
                                  label: LanguageHelper.currentLanguageText(
                                      LanguageHelper.galleryImageTransKey),
                                  imageURLs: controller.galleryImageURLs,
                                  onImageUploadTap:
                                      controller.onUploadAddGalleryImageTap,
                                  onImageEditTap:
                                      controller.onUploadEditGalleryImageTap,
                                  onImageDeleteTap:
                                      controller.onUploadDeleteGalleryImageTap),
                              AppGaps.hGap24, */
/*                               Row(
                                children: [
                                  Text(
                                      LanguageHelper.currentLanguageText(
                                          LanguageHelper.itemPriceTransKey),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium
                                          ?.copyWith(color: Colors.black)),
                                ],
                              ),
                              AppGaps.hGap24,
                              /* <---- Edit your phone number ----> */
                              CustomTextFormField(
                                labelText: LanguageHelper.currentLanguageText(
                                    LanguageHelper.priceTransKey),
                                hintText: r'  eg  10$',
                                textInputType: TextInputType.phone,
                                // prefixIcon: SvgPicture.asset(
                                //     AppAssetImages.callingSVGLogoLine,
                                //     color: AppColors.bodyTextColor)
                              ),
                              AppGaps.hGap24,
                              Row(
                                children: [
                                  Text(
                                      LanguageHelper.currentLanguageText(
                                          LanguageHelper
                                              .setQualityBasedPriceTransKey),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium
                                          ?.copyWith(color: Colors.black)),
                                ],
                              ),
                              AppGaps.hGap24,
                              SizedBox(
                                height: 120,
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(2),
                                      height: 96,
                                      width: 83,
                                      child: Column(
                                        children: [
                                          CustomTextFormField(
                                            labelText: LanguageHelper
                                                .currentLanguageText(
                                                    LanguageHelper
                                                        .minimumTransKey),
                                            hintText: ' 1',
                                            textInputType: TextInputType.phone,
                                            // prefixIcon: SvgPicture.asset(
                                            //     AppAssetImages.callingSVGLogoLine,
                                            //     color: AppColors.bodyTextColor)
                                          ),
                                        ],
                                      ),
                                    ),
                                    AppGaps.wGap7,
                                    // const Spacer(),
                                    Container(
                                      margin: const EdgeInsets.all(2),
                                      height: 96,
                                      width: 83,
                                      child: Column(
                                        children: [
                                          CustomTextFormField(
                                            labelText: LanguageHelper
                                                .currentLanguageText(
                                                    LanguageHelper
                                                        .maximumTransKey),
                                            hintText: ' 1',
                                            textInputType: TextInputType.phone,
                                            // prefixIcon: SvgPicture.asset(
                                            //     AppAssetImages.callingSVGLogoLine,
                                            //     color: AppColors.bodyTextColor)
                                          ),
                                        ],
                                      ),
                                    ),
                                    AppGaps.wGap7,
                                    // const Spacer(),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.all(2),
                                        height: 96,
                                        width: 120,
                                        child: Column(
                                          children: [
                                            CustomTextFormField(
                                              labelText: LanguageHelper
                                                  .currentLanguageText(
                                                      LanguageHelper
                                                          .priceTransKey),
                                              hintText: r' eg:  10$',
                                              textInputType:
                                                  TextInputType.phone,
                                              // prefixIcon: SvgPicture.asset(
                                              //     AppAssetImages.callingSVGLogoLine,
                                              //     color: AppColors.bodyTextColor)
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              AppGaps.hGap5,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomTightTextButtonWidget(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Text(
                                        LanguageHelper.currentLanguageText(
                                            LanguageHelper.addMoreTransKey),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color: AppColors.primaryColor)),
                                  )
                                ],
                              ),
                              AppGaps.hGap24,

                              CustomTextFormField(
                                labelText: LanguageHelper.currentLanguageText(
                                    LanguageHelper.sellOfferTransKey),
                                hintText: r'  eg:-  $50',
                                textInputType: TextInputType.phone,
                                // prefixIcon: SvgPicture.asset(
                                //     AppAssetImages.callingSVGLogoLine,
                                //     color: AppColors.bodyTextColor)
                              ), */
                              // Bottom extra spaces
                              AppGaps.hGap30,
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                /* <-------- Bottom bar --------> */
                bottomNavigationBar: CustomScaffoldBottomBarWidget(
                    child: CustomStretchedTextButtonWidget(
                  buttonText: LanguageHelper.currentLanguageText(
                      LanguageHelper.nextTransKey),
                  onTap: controller.onNextButtonTap,
                )),
              ),
            ));
  }
}
