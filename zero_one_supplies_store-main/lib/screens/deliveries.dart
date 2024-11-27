import 'package:ecomikstoreapp/controller/deliveries_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_colors.dart';
import 'package:ecomikstoreapp/utils/constants/app_gaps.dart';
import 'package:ecomikstoreapp/utils/constants/app_images.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Deliveries extends StatelessWidget {
  const Deliveries({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeliveryScreenController>(
        init: DeliveryScreenController(),
        builder: (controller) => DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image:
                          Image.asset(AppAssetImages.backgroundFullPng).image,
                      fit: BoxFit.fill)),
              child: Scaffold(
                appBar: CoreWidgets.appBarWidget(
                    screenContext: context,
                    hasBackButton: true,
                    titleWidget: Text(LanguageHelper.currentLanguageText(
                        LanguageHelper.deliveriesTransKey))),
                body: CustomScaffoldBottomBarWidget(
                    child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppGaps.hGap10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: controller.tabNames.map((tabName) {
                        final index = controller.tabNames.indexOf(tabName);
                        return TextButton(
                          onPressed: () {
                            controller.selectedTabIndex = index;
                            controller.update();
                          },
                          style: TextButton.styleFrom(
                              elevation: 10,
                              shadowColor: controller.selectedTabIndex == index
                                  ? AppColors.primaryColor.withOpacity(0.25)
                                  : Colors.black.withOpacity(0.05),
                              backgroundColor:
                                  controller.selectedTabIndex == index
                                      ? AppColors.primaryColor
                                      : Colors.white,
                              padding: EdgeInsets.symmetric(
                                  vertical: 9,
                                  horizontal:
                                      controller.selectedTabIndex == index
                                          ? 24
                                          : 20),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)))),
                          child: Text(
                            tabName,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: controller.selectedTabIndex == index
                                    ? Colors.white
                                    : AppColors.darkColor),
                          ),
                        );
                      }).toList(),
                    ),
                    AppGaps.hGap8,
                    Expanded(
                      child: ListView.separated(
                          padding: const EdgeInsets.only(top: 16, bottom: 30),
                          itemBuilder: ((context, index) {
                            return Container(
                              height: 128,
                              padding: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.0)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${LanguageHelper.currentLanguageText(LanguageHelper.trackingIdTransKey)} #nffanao46666',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${LanguageHelper.currentLanguageText(LanguageHelper.deliverToTransKey)}: Liton Nandi',
                                        style: const TextStyle(
                                            color: AppColors.darkColor),
                                      ),
                                      const Text(
                                        '7 Rastar Mor, Khulna Sadar',
                                        style: TextStyle(
                                            color: AppColors.darkColor),
                                      ),
                                      const Text(
                                        '01403224486',
                                        style: TextStyle(
                                            color: AppColors.darkColor),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(5.0),
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                              const Color(0xFF4BCBF9),
                                              const Color(0xFF4BCBF9)
                                                  .withOpacity(0.4)
                                            ]),
                                            borderRadius:
                                                BorderRadius.circular(6.0)),
                                        child: Text(
                                          LanguageHelper.currentLanguageText(
                                              LanguageHelper
                                                  .processingTransKey),
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.white),
                                        ),
                                      ),
                                      SvgPicture.asset(
                                          AppAssetImages.arrowrightSVGLogoLine)
                                    ],
                                  )
                                ],
                              ),
                            );
                          }),
                          separatorBuilder: ((context, index) =>
                              AppGaps.hGap16),
                          itemCount: 2),
                    )
                  ],
                )),
              ),
            ));
  }
}
