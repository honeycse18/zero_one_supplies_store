import 'package:ecomikstoreapp/controller/requested_offer_controller.dart';
import 'package:ecomikstoreapp/models/api_responses/requested_offer_list_ressponse.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/constants/app_images.dart';
import 'package:ecomikstoreapp/utils/constants/app_text_styles.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class RequestedOfferScreen extends StatelessWidget {
  const RequestedOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestedOfferScreenController>(
        init: RequestedOfferScreenController(),
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
                    hasBackButton: true,
                    titleWidget: const Text('Requested Offers')),
                body: CustomScaffoldBodyWidget(
                  child: RefreshIndicator(
                    onRefresh: () async =>
                        controller.receiveOffersPagingController.refresh(),
                    child: CustomScrollView(
                      slivers: [
                        const SliverToBoxAdapter(
                          child: AppGaps.hGap10,
                        ),
                        const SliverToBoxAdapter(
                          child: Text(
                            'All Requested Offer',
                            style: AppTextStyles.bodyLargeMediumTextStyle,
                          ),
                        ),
                        const SliverToBoxAdapter(
                          child: AppGaps.hGap20,
                        ),
                        PagedSliverList.separated(
                          pagingController:
                              controller.receiveOffersPagingController,
                          builderDelegate:
                              PagedChildBuilderDelegate<VendorRecietOfferList>(
                                  itemBuilder: (context, item, index) {
                            final VendorRecietOfferList receiveOfferList = item;
                            return Text(receiveOfferList.id);
                          }),
                          separatorBuilder: (context, index) => AppGaps.hGap16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
