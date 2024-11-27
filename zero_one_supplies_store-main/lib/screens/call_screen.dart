import 'package:ecomikstoreapp/controller/call_screen_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:ecomikstoreapp/widgets/screen_widgets/call_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Get screen size
    final screenSize = MediaQuery.of(context).size;
    return GetBuilder<CallSecondScreenController>(
        init: CallSecondScreenController(),
        builder: (controller) => DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: Image.asset(AppAssetImages.backgroundScreen).image,
                      fit: BoxFit.fill)),
              child: Scaffold(
                  // backgroundColor: Colors.white,
                  /* <-------- Content --------> */
                  body: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppGaps.screenPaddingValue),
                    child: SafeArea(
                      child: SingleChildScrollView(
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  /* <---- Ripple / Wave effect from caller profile 
                                   picture ----> */
                                  Ripples(
                                      color: AppColors.primaryColor
                                          .withOpacity(0.5),
                                      size: screenSize.width * 0.45,
                                      child: CircleAvatar(
                                        radius: 75,
                                        backgroundImage: Image.asset(
                                                AppAssetImages.reviewer1Image)
                                            .image,
                                      )),
                                  /* <---- 'Calling' text positioned above of 
                                   caller image ----> */
                                  Positioned(
                                      top: 40,
                                      child: Text(
                                        LanguageHelper.currentLanguageText(
                                            LanguageHelper.callingTransKey),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.bodyTextColor),
                                      ))
                                ],
                              ),
                              /* <---- Caller name ----> */
                              Text(
                                'John Smith Paul',
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              AppGaps.hGap24,
                              /* <---- Caller call time duration ----> */
                              const Text(
                                '12:08',
                                style: TextStyle(
                                    color: AppColors.bodyTextColor,
                                    fontWeight: FontWeight.w500),
                              ),
                              AppGaps.hGap30,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  /* <-------- Bottom bar --------> */
                  bottomNavigationBar: CustomScaffoldBottomBarWidget(
                    child: SizedBox(
                      height: 70,
                      child: Center(
                          child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /* <---- Microphone toggle circle button ----> */
                          Obx(() => CustomIconButtonWidget(
                              onTap: () {
                                controller.isMicrophoneActive.value =
                                    !controller.isMicrophoneActive.value;
                                controller.update();
                              },
                              fixedSize: const Size(70, 70),
                              backgroundColor:
                                  controller.isMicrophoneActive.value
                                      ? AppColors.darkColor
                                      : Colors.transparent,
                              isCircleShape: true,
                              border: controller.isMicrophoneActive.value
                                  ? null
                                  : Border.all(color: Colors.transparent),
                              child: SvgPicture.asset(
                                  AppAssetImages.microphoneSVGLogoLine,
                                  color: controller.isMicrophoneActive.value
                                      ? Colors.white
                                      : AppColors.darkColor))),
                          AppGaps.wGap32,
                          /* <---- Call circle button ----> */
                          CustomIconButtonWidget(
                              onTap: () {
                                Get.back();
                              },
                              fixedSize: const Size(70, 70),
                              backgroundColor: AppColors.alertColor,
                              isCircleShape: true,
                              child: SvgPicture.asset(
                                  AppAssetImages.callSVGLogoSolid,
                                  color: Colors.white)),
                          AppGaps.wGap32,
                          /* <---- Speaker toggle circle button ----> */
                          Obx(() => CustomIconButtonWidget(
                              onTap: () {
                                controller.isSpeakerActive.value =
                                    !controller.isSpeakerActive.value;
                                controller.update();
                              },
                              fixedSize: const Size(70, 70),
                              backgroundColor: controller.isSpeakerActive.value
                                  ? AppColors.darkColor
                                  : Colors.transparent,
                              border: controller.isSpeakerActive.value
                                  ? null
                                  : Border.all(color: Colors.transparent),
                              isCircleShape: true,
                              child: SvgPicture.asset(
                                AppAssetImages.speakerSVGLogoLine,
                                color: controller.isSpeakerActive.value
                                    ? Colors.white
                                    : AppColors.darkColor,
                              ))),
                        ],
                      )),
                    ),
                  )),
            ));
  }
}
