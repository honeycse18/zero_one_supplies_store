import 'package:ecomikstoreapp/controller/pickup_second_controller.dart';
import 'package:ecomikstoreapp/models/fake_data.dart';
import 'package:ecomikstoreapp/models/fake_models/FakeDeliveryTime.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../utils/constants/app_page_names.dart';

class PickupSecondScreen extends StatelessWidget {
  const PickupSecondScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PickupSecondScreenController>(
        init: PickupSecondScreenController(),
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
                    titleWidget: Text(LanguageHelper.currentLanguageText(
                        LanguageHelper.pickupRequestTransKey))),
                /* <-------- Content --------> */
                body: CustomScaffoldBodyWidget(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppGaps.hGap15,
                        /* <---- Product picture ----> */
                        Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Text(
                                      LanguageHelper.currentLanguageText(
                                          LanguageHelper
                                              .recipientDetailsTransKey),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium
                                          ?.copyWith(color: Colors.black)),
                                ],
                              ),
                              AppGaps.hGap24,

                              TextFormFieldWidget(
                                  labelText: LanguageHelper.currentLanguageText(
                                      LanguageHelper.recipientNameTransKey),
                                  hintText: '  jhon Doe',
                                  // textInputType: TextInputType.phone,
                                  prefixIcon: SvgPicture.asset(
                                      AppAssetImages.profileSVGLogoLine,
                                      color: AppColors.bodyTextColor)),
                              AppGaps.hGap24,
                              TextFormFieldWidget(
                                  labelText: LanguageHelper.currentLanguageText(
                                      LanguageHelper.recipientPhoneTransKey),
                                  hintText: '  +88013456798',
                                  // textInputType: TextInputType.phone,
                                  prefixIcon: SvgPicture.asset(
                                      AppAssetImages.callingSVGLogoLine,
                                      color: AppColors.bodyTextColor)),
                              AppGaps.hGap24,

                              TextFormFieldWidget(
                                labelText: LanguageHelper.currentLanguageText(
                                    LanguageHelper.deliveryAreaTransKey),
                                hintText:
                                    ' Gauteng > Vereeniging > 1046 Zigzag Rd',
                                suffixIcon: SvgPicture.asset(
                                    AppAssetImages.searchSVGLogoLine),
                              ),

                              AppGaps.hGap24,

                              TextFormFieldWidget(
                                  labelText: LanguageHelper.currentLanguageText(
                                      LanguageHelper.recipientAddressTransKey),
                                  hintText: ' House no 14/20 zignf rd',
                                  // suffixIcon:
                                  //     SvgPicture.asset(AppAssetImages.searchSVGLogoLine),
                                  // textInputType: TextInputType.phone,
                                  prefixIcon: SvgPicture.asset(
                                      AppAssetImages.locationSVGLogoLine,
                                      color: AppColors.bodyTextColor)),

                              AppGaps.hGap24,

                              Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.8),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(18)),
                                    border: Border.all(
                                        color: Colors.black.withOpacity(0.1))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // ignore: use_colored_box
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 24,
                                          width: 24,
                                          child: SvgPicture.asset(
                                              AppAssetImages.truckSVGLogo,
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                    AppGaps.wGap15,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              LanguageHelper.currentLanguageText(
                                                  LanguageHelper
                                                      .estimatedDeliveryTransKey),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w700),
                                            )
                                          ],
                                        ),
                                        AppGaps.hGap10,
                                        const Row(
                                          children: [
                                            Text('Tus, Mar 10  '),
                                            AppGaps.wGap10,
                                            Text('10:00 AM-01:00pm')
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              AppGaps.hGap24,
                              Row(
                                children: [
                                  Text(
                                      LanguageHelper.currentLanguageText(
                                          LanguageHelper
                                              .preferredDeliveryTimeTransKey),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium
                                          ?.copyWith(
                                              color: Colors.black
                                                  .withOpacity(0.8))),
                                ],
                              ),

                              AppGaps.hGap10,
                              SizedBox(
                                height: 86,
                                // width: 86,
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      final FakeDeliveryTime deliveryTime =
                                          FakeData.deliveryTimes[index];
                                      return Select(
                                        isSelected: deliveryTime.isSelected,
                                        dateTimeText: deliveryTime.dateTimeText,
                                        onTap: () {
                                          Helper.select1ItemFromList(
                                              FakeData.deliveryTimes.length,
                                              index, (i, selected) {
                                            FakeData.deliveryTimes[i]
                                                .isSelected = selected;
                                          });
                                          // setState(() {});
                                        },
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        AppGaps.wGap5,
                                    itemCount: FakeData.deliveryTimes.length),
                              ),
                              AppGaps.hGap24,
                              Container(
                                height: 176,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18)),
                                    color: Colors.white),
                                child: Column(
                                  children: <Widget>[
                                    RadioListTile(
                                      activeColor: AppColors.pendingColor,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                      title: Text(
                                          LanguageHelper.currentLanguageText(
                                              LanguageHelper.fullDayTransKey)),
                                      value: '0',
                                      groupValue: controller.selectedOption,
                                      onChanged: (value) {
                                        // setState(() {
                                        controller.selectedOption = value!;
                                        controller.update();
                                        // });
                                      },
                                    ),
                                    RadioListTile(
                                      activeColor: AppColors.pendingColor,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                      title: Text(
                                          LanguageHelper.currentLanguageText(
                                              LanguageHelper
                                                  .morning9To1TransKey)),
                                      value: '1',
                                      groupValue: controller.selectedOption,
                                      onChanged: (value) {
                                        // setState(() {
                                        controller.selectedOption = value!;
                                        controller.update();
                                        // });
                                      },
                                    ),
                                    RadioListTile(
                                      activeColor: AppColors.pendingColor,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                      title: Text(
                                          LanguageHelper.currentLanguageText(
                                              LanguageHelper
                                                  .afternoon3To9TransKey)),
                                      value: '2',
                                      groupValue: controller.selectedOption,
                                      onChanged: (value) {
                                        // setState(() {
                                        controller.selectedOption = value!;
                                        controller.update();
                                        // });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              // ottom extra spaces
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
                  onTap: () {
                    Get.toNamed(AppPageNames.pickupThirdScreen);
                  },
                )),
              ),
            ));
  }
}

class Select extends StatelessWidget {
  const Select({
    super.key,
    required this.isSelected,
    required this.dateTimeText,
    required this.onTap,
  });

  final bool isSelected;
  final String dateTimeText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? Selected(dateTimeText: dateTimeText, onTap: onTap)
        : DeSelected(dateTimeText: dateTimeText, onTap: onTap);
  }
}

class Selected extends StatelessWidget {
  const Selected({super.key, required this.dateTimeText, required this.onTap});

  final Function() onTap;
  final String dateTimeText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86,
      width: 86,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(18)),
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor,
            AppColors.primaryColor.withOpacity(0.3)
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(
              dateTimeText,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DeSelected extends StatelessWidget {
  const DeSelected(
      {super.key, required this.dateTimeText, required this.onTap});

  final Function() onTap;
  final String dateTimeText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86,
      width: 86,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(18)),
        color: Colors.white,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(
              dateTimeText,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
