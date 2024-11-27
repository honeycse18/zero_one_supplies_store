import 'package:ecomikstoreapp/models/fake_models/my_order_model.dart';
import 'package:ecomikstoreapp/utils/constants/app_constant_imports.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:ecomikstoreapp/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

class EditProductScreen extends StatefulWidget {
  /// The parameter variable argument holds product object to edit product.
  final Object? product;

  const EditProductScreen({super.key, this.product});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  /// Current product data to show from parameter of this screen.
  FakeMyOrderModel _currentProduct = FakeMyOrderModel(
      name: 'AJ504 Green Airpod',
      price: '23.00',
      productImage:
          Image.asset('assets/images/demo_images/my_orders/image1.png').image,
      dateText: '26 Dec, 2021',
      orderStatus: 'pending');

  /* <-------- Select current product index initially --------> */
  void _setCurrentProduct(Object? argument) {
    if (argument != null) {
      if (argument is FakeMyOrderModel) {
        _currentProduct = argument;
      }
    }
  }

  /* <-------- Initial state --------> */
  @override
  void initState() {
    _setCurrentProduct(widget.product);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: Image.asset(AppAssetImages.backfake).image,
              fit: BoxFit.fill)),
      child: Scaffold(
        /* <-------- Appbar --------> */
        appBar: CoreWidgets.appBarWidget(
            screenContext: context,
            hasBackButton: true,
            titleWidget: Text(LanguageHelper.currentLanguageText(
                LanguageHelper.editProductTransKey))),
        /* <-------- Content --------> */
        body: CustomScaffoldBodyWidget(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Top extra spaces
                AppGaps.hGap15,
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          /* <---- Profile picture ----> */
                          CircleAvatar(
                            backgroundImage: _currentProduct.productImage,
                            radius: 64,
                          ),
                          /* <---- Small camera circle icon button ----> */
                          Positioned(
                              bottom: 7,
                              right: -3,
                              child: IconButton(
                                onPressed: () {},
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(
                                    minHeight: 34, minWidth: 34),
                                icon: Container(
                                  height: 34,
                                  width: 34,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.primaryColor,
                                      border: Border.all(color: Colors.white)),
                                  child: SvgPicture.asset(
                                    AppAssetImages.cameraSVGLogoSolid,
                                    height: 14,
                                    width: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ))
                        ],
                      ),
                      AppGaps.hGap18,
                      /* <---- Profile name ----> */
                      GestureDetector(
                        onTap: () => setState(() => _currentProduct
                            .isOutOfStock = !_currentProduct.isOutOfStock),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              LanguageHelper.currentLanguageText(
                                  LanguageHelper.outOfStockTransKey),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color: AppColors.bodyTextColor,
                                      fontWeight: FontWeight.w500),
                            ),
                            AppGaps.wGap8,
                            /* <---- Remember me toggle button ----> */
                            FlutterSwitch(
                              value: _currentProduct.isOutOfStock,
                              width: 35,
                              height: 20,
                              toggleSize: 12,
                              activeColor: AppColors.primaryColor,
                              onToggle: (value) {
                                setState(
                                    () => _currentProduct.isOutOfStock = value);
                              },
                            ),
                          ],
                        ),
                      ),
                      AppGaps.hGap32,

                      // CustomHorizontalDashedLineWidget(
                      //     color: AppColors.darkColor.withOpacity(0.1)),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppGaps.hGap32,
                            Row(
                              children: [
                                Text('Strore info',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(
                                            color: AppColors.primaryColor)),
                              ],
                            ),
                            AppGaps.hGap24,
                            /* <---- Edit your name ----> */
                            TextFormFieldWidget(
                                labelText: LanguageHelper.currentLanguageText(
                                    LanguageHelper.storeNameTransKey),
                                hintText: 'Economik',
                                initialValue: _currentProduct.name,
                                prefixIcon: AppGaps.emptyGap),
                            AppGaps.hGap24,
                            /* <---- Edit your email address ----> */
                            TextFormFieldWidget(
                              isReadOnly: true,
                              labelText: LanguageHelper.currentLanguageText(
                                  LanguageHelper.categoryTransKey),
                              hintText: 'Electronics',
                              initialValue: 'Headphone',
                              prefixIcon: AppGaps.emptyGap,
                              suffixIcon: PopupMenuButton<int>(
                                  padding: const EdgeInsets.only(right: 5),
                                  position: PopupMenuPosition.under,
                                  // icon: const Icon(Icons.more_vert_rounded, color: AppColors.darkColor),
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
                                            'Headphone',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        const PopupMenuItem<int>(
                                          value: 1,
                                          child: Text(
                                            'Camera',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        const PopupMenuItem<int>(
                                          value: 2,
                                          child: Text(
                                            'Electronics',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ]),
                            ),
                            // AppGaps.hGap24,
                            AppGaps.hGap24,
                            /* <---- Edit your name ----> */
                            TextFormFieldWidget(
                                labelText: LanguageHelper.currentLanguageText(
                                    LanguageHelper.phoneTransKey),
                                hintText: '+8817 2729 2899',
                                initialValue: _currentProduct.name,
                                prefixIcon: SvgPicture.asset(
                                    AppAssetImages.callingSVGLogoLine,
                                    color: AppColors.bodyTextColor)),
                            /* <---- Edit your date of birth ----> */
                            // Row(
                            //   crossAxisAlignment: CrossAxisAlignment.center,
                            //   mainAxisSize: MainAxisSize.max,
                            //   children: [
                            //     Expanded(
                            //       child: CustomTextFormField(
                            //           labelText: 'Item price',
                            //           hintText: '0.00',
                            //           initialValue: _currentProduct.price,
                            //           prefixIcon: const Text('\$')),
                            //     ),
                            //     AppGaps.wGap16,
                            //     const Expanded(
                            //       child: CustomTextFormField(
                            //           labelText: 'Stock',
                            //           hintText: '0',
                            //           initialValue: '30',
                            //           prefixIcon: AppGaps.emptyGap),
                            //     ),
                            //   ],
                            // ),
                            AppGaps.hGap24,
                            /* <---- Edit your name ----> */
                            TextFormFieldWidget(
                                labelText: LanguageHelper.currentLanguageText(
                                    LanguageHelper.emailAddressTransKey),
                                hintText: 'contact@econmomik.com',
                                initialValue: _currentProduct.name,
                                prefixIcon: SvgPicture.asset(
                                    AppAssetImages.messageSVGLogoLine,
                                    color: AppColors.bodyTextColor)),

                            AppGaps.hGap24,
                            /* <---- Edit your name ----> */
                            TextFormFieldWidget(
                                labelText: LanguageHelper.currentLanguageText(
                                    LanguageHelper.locationTransKey),
                                hintText: 'Green Street 738,NY,USA',
                                initialValue: _currentProduct.name,
                                prefixIcon: SvgPicture.asset(
                                    AppAssetImages.locationSVGLogoLine,
                                    color: AppColors.bodyTextColor)),

                            AppGaps.hGap24,
                            /* <---- Edit your name ----> */
                            TextFormFieldWidget(
                                labelText: LanguageHelper.currentLanguageText(
                                    LanguageHelper.descriptionTransKey),
                                hintText: 'Sansa acacca',
                                initialValue: _currentProduct.name,
                                prefixIcon: SvgPicture.asset(
                                    AppAssetImages.document,
                                    color: AppColors.bodyTextColor)),

                            AppGaps.hGap24,
                            /* <---- Edit your name ----> */
                            TextFormFieldWidget(
                                labelText: LanguageHelper.currentLanguageText(
                                    LanguageHelper.taxNameTransKey),
                                hintText: 'Green Street 738,NY,USA',
                                initialValue: _currentProduct.name,
                                prefixIcon: SvgPicture.asset(
                                    AppAssetImages.task,
                                    color: AppColors.bodyTextColor)),

                            AppGaps.hGap24,
                            /* <---- Edit your name ----> */
                            TextFormFieldWidget(
                                labelText: LanguageHelper.currentLanguageText(
                                    LanguageHelper.taxNumberTransKey),
                                hintText: 'Green Street 738,NY,USA',
                                initialValue: _currentProduct.name,
                                prefixIcon: SvgPicture.asset(
                                    AppAssetImages.task,
                                    color: AppColors.bodyTextColor)),

                            AppGaps.hGap24,
                            /* <---- Edit your name ----> */
                            TextFormFieldWidget(
                                labelText: LanguageHelper.currentLanguageText(
                                    LanguageHelper.nidNumberTransKey),
                                hintText: '7151752565632',
                                initialValue: _currentProduct.name,
                                prefixIcon: SvgPicture.asset(
                                    AppAssetImages.task,
                                    color: AppColors.bodyTextColor)),
                            AppGaps.hGap24,
                            Row(
                              children: [
                                CustomTightTextButtonWidget(
                                    onTap: () {},
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SvgPicture.asset(
                                            AppAssetImages.plusSVGLogoSolid,
                                            color: AppColors.primaryColor),
                                        AppGaps.wGap4,
                                        Text(LanguageHelper.currentLanguageText(
                                            LanguageHelper
                                                .addMoreImageTransKey)),
                                      ],
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Bottom extra spaces
                AppGaps.hGap30,
              ],
            ),
          ),
        ),
        /* <-------- Bottom bar --------> */
        bottomNavigationBar: CustomScaffoldBottomBarWidget(
            child: CustomStretchedTextButtonWidget(
          buttonText: LanguageHelper.currentLanguageText(
              LanguageHelper.updateInfoTransKey),
          onTap: () {},
        )),
      ),
    );
  }
}
