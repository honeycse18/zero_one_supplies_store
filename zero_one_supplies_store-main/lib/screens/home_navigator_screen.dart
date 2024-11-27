import 'dart:io';

import 'package:ecomikstoreapp/controller/home_navigator_screen_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

// import 'junk.dart';

class HomeNavigatorScreen extends StatelessWidget {
  const HomeNavigatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeNavigatorScreenController>(
      init: HomeNavigatorScreenController(),
      builder: (controller) => WillPopScope(
        onWillPop: () => controller.onWillPop(context),
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: Image.asset(AppAssetImages.backgroundFullPng).image,
                  fit: BoxFit.fill)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: controller.nestedScreenWidget,
            bottomNavigationBar: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                    height: 77,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: 60,
                          decoration: BoxDecoration(
                              // color: Colors.red,
                              image: DecorationImage(
                                  image: Image.asset(AppAssetImages
                                          .bottomMenuBarBackground)
                                      .image,
                                  fit: BoxFit.fill)),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    controller.bottomMenuButton('Product',
                                        AppAssetImages.productMenu, 0),
                                    controller.bottomMenuButton(
                                        'Order', AppAssetImages.orderMenu, 1),
                                  ],
                                )),
                                AppGaps.wGap60,
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      controller.bottomMenuButton('Message',
                                          AppAssetImages.messageMenu, 3),
                                      controller.bottomMenuButton('Profile',
                                          AppAssetImages.profileMenu, 4)
                                    ],
                                  ),
                                )
                              ]),
                        ),
                        Positioned(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                child: Container(
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient:
                                          (controller.currentPageIndex == 2)
                                              ? LinearGradient(colors: [
                                                  AppColors.primaryColor,
                                                  AppColors.primaryColor
                                                      .withOpacity(0.4)
                                                ])
                                              : null,
                                      image: (controller.currentPageIndex == 2)
                                          ? null
                                          : DecorationImage(
                                              image: Image.asset(AppAssetImages
                                                      .homeMenuBack)
                                                  .image,
                                              fit: BoxFit.fill)),
                                  child: SvgPicture.asset(
                                    AppAssetImages.homeMenu,
                                    color: (controller.currentPageIndex == 2)
                                        ? Colors.white
                                        : AppColors.bodyTextColor,
                                  ),
                                ),
                                onTap: () {
                                  controller.currentPageIndex = 2;
                                  controller.setCurrentTab();
                                },
                              ),
                              Expanded(
                                child: Container(),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
                Container(
                  height: Platform.isAndroid ? 0 : 25,
                  decoration: const BoxDecoration(color: Color(0xFFF9F1EB)),
                )
              ],
            ),
          ),
        ),
      ),
    );
    // Scaffold(
    //   backgroundColor: AppColors.shadeColor2,
    //   /* <-------- Content --------> */
    //   body: _nestedScreenWidget,
    //   /* <-------- Bottom tab bar --------> */
    //   bottomNavigationBar: ClipRRect(
    //     borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
    //     child: Container(
    //       decoration: BoxDecoration(
    //           // image: DecorationImage(
    //           //     image: Image.asset(AppAssetImages.backgroundFull).image,
    //           //     fit: BoxFit.cover)
    //           ),
    //       child: CustomBottomNavigationBar(
    //         selectedIndex: _currentPageIndex,
    //         curve: Curves.easeOutBack,
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         itemCornerRadius: 10,
    //         showElevation: false, // use this to remove appBar's elevation
    //         onItemSelected: (selectedPageIndex) => setState(() {
    //           // Set current index and tab screen
    //           _currentPageIndex = selectedPageIndex;
    //           _setCurrentTab();
    //         }),
    //         items: [
    //           CustomBottomNavigationBarItem(
    //             svgAssetIconName: AppAssetImages.homeSVGLogoLine,
    //             labelText: 'Home',
    //             width: 100,
    //             inactiveColor: AppColors.bodyTextColor,
    //           ),
    //           CustomBottomNavigationBarItem(
    //             svgAssetIconName: AppAssetImages.boxSVGLogoLine,
    //             labelText: 'Products',
    //             width: 115,
    //             inactiveColor: AppColors.bodyTextColor,
    //           ),
    //           CustomBottomNavigationBarItem(
    //             svgAssetIconName: AppAssetImages.taskSVGLogoLine,
    //             labelText: 'Orders',
    //             width: 100,
    //             inactiveColor: AppColors.bodyTextColor,
    //           ),
    //           CustomBottomNavigationBarItem(
    //             svgAssetIconName: AppAssetImages.profileSVGLogoLine,
    //             labelText: 'Account',
    //             width: 110,
    //             inactiveColor: AppColors.bodyTextColor,
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
