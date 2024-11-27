import 'package:ecomikstoreapp/controller/message_recipients_screen_controller.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageRecipientsScreen extends StatelessWidget {
  const MessageRecipientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessageRecipientsScreenController>(
      init: MessageRecipientsScreenController(),
      builder: (controller) => DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: Image.asset(AppAssetImages.backgroundFullPng).image,
                fit: BoxFit.fill)),
        child: Scaffold(
          // / <-------- Appbar --------> /
          appBar: CoreWidgets.appBarWidget(
              screenContext: context,
              hasBackButton: false,
              titleWidget: Text(LanguageHelper.currentLanguageText(
                  LanguageHelper.messageTransKey))),
          // / <-------- Content --------> /
          body: CustomScaffoldBodyWidget(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                // crossAxisAlignment: CrossAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          final chatUser = controller.chatUsers[index];
                          return CustomListTileWidget(
                            child: Row(
                              children: [
                                NoImageAvatarWidget(
                                    firstName: chatUser.firstName,
                                    lastName: chatUser.lastName),
                                AppGaps.wGap15,
                                Expanded(
                                    child: Text(
                                        '${chatUser.firstName} ${chatUser.lastName}'))
                              ],
                            ),
                            onTap: () {
                              Get.toNamed(
                                  AppPageNames.chatWithDeliverymanScreen,
                                  arguments: chatUser);
                            },
                          );
                        },
                        separatorBuilder: (context, index) => AppGaps.hGap12,
                        itemCount: controller.chatUsers.length),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
