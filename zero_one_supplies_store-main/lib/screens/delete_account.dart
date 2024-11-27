
import 'package:ecomikstoreapp/controller/delete_account_screen_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_gaps.dart';
import 'package:ecomikstoreapp/utils/constants/app_images.dart';
import 'package:ecomikstoreapp/utils/constants/app_text_styles.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeleteAccountScreenController>(
        init: DeleteAccountScreenController(),
        global: false,
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
                    titleWidget: Text('Delete account')),
                body: CustomScaffoldBodyWidget(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppGaps.hGap30,
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Delete account',
                              style: AppTextStyles.headlineLargeBoldTextStyle
                                  .copyWith(color: Colors.black),
                            ),
                            AppGaps.hGap20,
                            const Text(
                                'Are you sure you want to delete your account? Please read how account deletion will affect.'), //Expanded(child: Text("Description")),
                            AppGaps.hGap20,
                            Text(
                              'Account',
                              style: AppTextStyles.headlineLargeBoldTextStyle
                                  .copyWith(color: Colors.black),
                            ),
                            AppGaps.hGap20,
                            const Text(
                                'Deleting your account removes personal information our database. Tour email becomes permanently reserved and same email cannot be re-use to register a new account.'), //Expanded(child: Text("Description")),

                            AppGaps.hGap30,
                            CustomStretchedButtonWidget(
                                onTap: () {},
                                // onTap: controller.onContinueButtonTap,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.delete),
                                    AppGaps.wGap10,
                                    RawButtonWidget(
                                      onTap: controller.deleteAccount,
                                      child: Text(
                                        'Delete Account',
                                        style: AppTextStyles
                                            .bodyLargeMediumTextStyle
                                            .copyWith(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
              ),
            ));
  }
}
