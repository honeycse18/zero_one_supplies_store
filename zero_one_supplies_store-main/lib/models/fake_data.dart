import 'package:ecomikstoreapp/models/fake_models/FakeDeliveryTime.dart';
import 'package:ecomikstoreapp/models/fake_models/chat_message_model.dart';
import 'package:ecomikstoreapp/models/fake_models/intro_content_model.dart';
import 'package:ecomikstoreapp/models/fake_models/my_order_model.dart';
import 'package:ecomikstoreapp/models/fake_models/product_model.dart';
import 'package:ecomikstoreapp/models/fake_models/product_review_model.dart';
import 'package:ecomikstoreapp/models/fake_models/recent_payment_product_model.dart';
import 'package:ecomikstoreapp/models/fake_models/recent_transaction_model.dart';
import 'package:ecomikstoreapp/models/fake_models/stock_color_model.dart';
import 'package:ecomikstoreapp/models/fake_models/stock_management_model.dart';
import 'package:ecomikstoreapp/models/payment_option_model.dart';
import 'package:ecomikstoreapp/utils/helpers/language_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/constants/app_images.dart';

class FakeData {
  // Intro screens
  static List<FakeIntroContent> fakeIntroContents = [
    FakeIntroContent(
        localSVGImageLocation: 'assets/images/intro.png',
        slogan: LanguageHelper.currentLanguageText(
            LanguageHelper.startSellWithUsTransKey),
        content:
            'Discover the easiest way to shop from a wide range of products across various categories. Enjoy a seamless shopping experience tailored just for you, right at your fingertips.'),
    FakeIntroContent(
        localSVGImageLocation: 'assets/images/intro_illustration2.png',
        slogan: 'Clearly different',
        content:
            'Browse through our extensive collection of fashion, electronics, home essentials, and more. Find exclusive deals, enjoy easy returns, and track your orders with a few taps.'),
    FakeIntroContent(
        localSVGImageLocation: 'assets/images/intro_illustration3.png',
        slogan: 'Buy, think & grow',
        content:
            'Sign up now to unlock a special welcome offer! Explore new arrivals and shop your favorite brands. Your next purchase is just a swipe away.'),
  ];

  // Products for various screens
  static List<FakeProductModel> products = [
    FakeProductModel(
        name: 'Sony DR-ZX1AP',
        shortDescription: 'Wireless headphone',
        productImage: Image.asset(
                'assets/images/demo_images/product_categories/item1.png')
            .image,
        price: '14.99',
        availableColors: [
          const Color(0xFFEB8169),
          const Color(0xFFC5C0D6),
          const Color(0xFF292B49),
          const Color(0xFF9BC9BE),
        ],
        availableSizes: ['S', 'M', 'X', 'XL', 'XXL'],
        description:
            'There are many variations of passages Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.',
        rating: 4.2),
    FakeProductModel(
        name: 'Bose Quiet Comfort',
        shortDescription: 'Wireless headphone',
        productImage: Image.asset(
                'assets/images/demo_images/product_categories/item2.png')
            .image,
        price: '14.99',
        availableColors: [
          const Color(0xFFEB8169),
          const Color(0xFFC5C0D6),
          const Color(0xFF292B49),
          const Color(0xFF9BC9BE),
        ],
        availableSizes: ['S', 'M', 'X', 'XL', 'XXL'],
        description:
            'There are many variations of passages Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.',
        rating: 4.2),
    FakeProductModel(
        name: 'Beats Pro Wired',
        shortDescription: 'Wireless headphone',
        productImage: Image.asset(
                'assets/images/demo_images/product_categories/item3.png')
            .image,
        price: '14.99',
        availableColors: [
          const Color(0xFFEB8169),
          const Color(0xFFC5C0D6),
          const Color(0xFF292B49),
          const Color(0xFF9BC9BE),
        ],
        availableSizes: ['S', 'M', 'X', 'XL', 'XXL'],
        description:
            'There are many variations of passages Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.',
        rating: 4.2),
    FakeProductModel(
        name: 'JBL Wireless',
        shortDescription: 'Wireless headphone',
        productImage: Image.asset(
                'assets/images/demo_images/product_categories/item4.png')
            .image,
        price: '14.99',
        availableColors: [
          const Color(0xFFEB8169),
          const Color(0xFFC5C0D6),
          const Color(0xFF292B49),
          const Color(0xFF9BC9BE),
        ],
        availableSizes: ['S', 'M', 'X', 'XL', 'XXL'],
        description:
            'There are many variations of passages Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.',
        rating: 4.2),
  ];
// Payment options
  static List<FakePaymentOptionModel> paymentOptions = [
    FakePaymentOptionModel(
        name: 'Credit card',
        paymentImage: SvgPicture.asset(AppAssetImages.masterCardSVGLogoColor)),
    FakePaymentOptionModel(
        name: 'Tmoney', paymentImage: Image.asset(AppAssetImages.tmoney)),
    FakePaymentOptionModel(
        name: 'Move to Money', paymentImage: Image.asset(AppAssetImages.moov)),
    FakePaymentOptionModel(
        name: 'Bank',
        paymentImage: SvgPicture.asset(AppAssetImages.bankSVGLogoLine)),
  ];
  static List<FakeDeliveryTime> deliveryTimes = [
    FakeDeliveryTime(dateTimeText: 'Tuesday \n 9 \n March', isSelected: false),
    FakeDeliveryTime(
        dateTimeText: 'Wednsday \n 10 \n March', isSelected: false),
    FakeDeliveryTime(
        dateTimeText: 'Thursday \n 11 \n March', isSelected: false),
    FakeDeliveryTime(dateTimeText: 'Friday \n 12 \n March', isSelected: false),
    FakeDeliveryTime(
        dateTimeText: 'Saturday \n 13 \n March', isSelected: false),
    FakeDeliveryTime(dateTimeText: 'Sunday \n 14 \n March', isSelected: false),
    FakeDeliveryTime(dateTimeText: 'Monday \n 15 \n March', isSelected: false),
  ];

  // Payment options
  static List<FakePaymentOptionModel> bidOptions = [
    FakePaymentOptionModel(
        name: 'African Art',
        paymentImage: SvgPicture.asset(AppAssetImages.african1)),
    FakePaymentOptionModel(
        name: 'African Art', paymentImage: Image.asset(AppAssetImages.tmoney)),
    FakePaymentOptionModel(
        name: 'African Art', paymentImage: Image.asset(AppAssetImages.moov)),
    FakePaymentOptionModel(
        name: 'African Art',
        paymentImage: SvgPicture.asset(AppAssetImages.bankSVGLogoLine)),
  ];

  /// Sample delivery man chat data
  static List<FakeChatMessageModel> deliveryManChats = [
    FakeChatMessageModel(
      isMyMessage: false,
      message: 'Hey there?\nHow much time?',
      dateTimeText: '11:59 am',
    ),
    FakeChatMessageModel(
      isMyMessage: true,
      message: 'On my way sir.\nWill reach in 10 mins.',
      dateTimeText: '11:59 am',
    ),
    FakeChatMessageModel(
      isMyMessage: false,
      message: 'Ok come with carefully!\nRemember the address please!',
      dateTimeText: '11:59 am',
    ),
    FakeChatMessageModel(
      isMyMessage: true,
      message:
          'Btw, I want to know more about the room space and facilities & can I get some more picture of current.',
      dateTimeText: 'Sep 04 2020',
    ),
  ];

  // static List<FakePaymentOptionModel> paymentOptions = [
  //   FakePaymentOptionModel(
  //       name: 'Credit card',
  //       paymentImage: SvgPicture.asset(AppAssetImages.masterCardSVGLogoColor)),
  //   FakePaymentOptionModel(
  //       name: 'Tmoney', paymentImage: Image.asset(AppAssetImages.tmoneySVG)),
  //   FakePaymentOptionModel(
  //       name: 'Move to Money',
  //       paymentImage: Image.asset(AppAssetImages.moovSVG)),
  //   FakePaymentOptionModel(
  //       name: 'Bank', paymentImage: SvgPicture.asset(AppAssetImages.bankSVG)),
  // ];

  /// Reviews
  static List<FakeProductReview> reviews = [
    FakeProductReview(
        reviewerName: 'Michle Jhon Smith',
        rating: 4,
        reviewDateText: '23 Sep, 2021',
        reviewText:
            'There are many variations of passages Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.',
        reviewerProfileImage:
            Image.asset('assets/images/demo_images/reviewers/reviewer1.png')
                .image),
    FakeProductReview(
        reviewerName: 'Angle Saniya',
        rating: 4,
        reviewDateText: '23 Sep, 2021',
        reviewText:
            'There are many variations of passages Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.',
        reviewerProfileImage:
            Image.asset('assets/images/demo_images/reviewers/reviewer2.png')
                .image)
  ];

  /// StockManagement
  static List<StoreManagementModel> stockManagement = [
    StoreManagementModel(
      productName: 'Ipod',
      price: 500.05,
      productCount: 20,
      productImageUrl: '',
    ),
    StoreManagementModel(
      productName: 'Xiomi',
      price: 200,
      productCount: 25,
      productImageUrl: '',
    ),
    StoreManagementModel(
      productName: 'Samsung',
      price: 150.70,
      productCount: 30,
      productImageUrl: '',
    ),
    StoreManagementModel(
      productName: 'Nokia',
      price: 50.75,
      productCount: 600,
      productImageUrl: '',
    ),
    StoreManagementModel(
        productName: 'HeroAlom',
        price: 1500,
        productCount: 1,
        productImageUrl: '',
        colorNames: [
          StockColorModel(
            colorName: 'Red',
            availableItem: 15,
          ),
          StockColorModel(
            colorName: 'blue',
            availableItem: 10,
          ),
          StockColorModel(
            colorName: 'green',
            availableItem: 5,
          ),
        ]),
  ];

  /// Available Color variant
  static List<StockColorModel> itemColor = [
    StockColorModel(
      colorName: 'Red',
      availableItem: 15,
    ),
    StockColorModel(
      colorName: 'Green',
      availableItem: 10,
    ),
    StockColorModel(
      colorName: 'Blue',
      availableItem: 5,
    ),
    StockColorModel(
      colorName: 'Yellow',
      availableItem: 20,
    ),
    StockColorModel(
      colorName: 'pink',
      availableItem: 31,
    ),
  ];

  /// My orders
  static List<FakeMyOrderModel> myOrders = [
    FakeMyOrderModel(
        name: 'AJ504 Green Airpod',
        price: '23.00',
        productImage:
            Image.asset('assets/images/demo_images/my_orders/bidproduct1.png')
                .image,
        dateText: '26 Dec, 2021',
        orderStatus: 'pending'),
    FakeMyOrderModel(
        name: 'Havit Gamenote',
        price: '23.00',
        productImage:
            Image.asset('assets/images/demo_images/my_orders/image2.png').image,
        dateText: '26 Dec, 2021',
        orderStatus: 'delivered'),
    FakeMyOrderModel(
        name: 'Havit HV-H2116D',
        price: '23.00',
        productImage: Image.asset(
                'assets/images/demo_images/product_categories/item3.png')
            .image,
        dateText: '26 Dec, 2021',
        orderStatus: 'processing'),
    FakeMyOrderModel(
        name: 'KWG Taurus M1',
        price: '23.00',
        productImage:
            Image.asset('assets/images/demo_images/my_orders/image3.png').image,
        dateText: '26 Dec, 2021',
        orderStatus: 'cancelled'),
    FakeMyOrderModel(
        name: 'Havit HV-H2002D',
        price: '23.00',
        productImage:
            Image.asset('assets/images/demo_images/my_orders/image4.png').image,
        dateText: '26 Dec, 2021',
        orderStatus: 'delivered'),
  ];

  /// My orders
  static List<FakeMyOrderModel> bidproducts = [
    FakeMyOrderModel(
        name: 'Frican Art',
        price: r'Height Bid $54.00',
        productImage:
            Image.asset('assets/images/demo_images/my_orders/bidproduct1.png')
                .image,
        dateText: '26 Dec, 2021',
        orderStatus: 'pending'),
    FakeMyOrderModel(
        name: 'Havit Gamenote',
        price: '23.00',
        productImage:
            Image.asset('assets/images/demo_images/my_orders/image2.png').image,
        dateText: '26 Dec, 2021',
        orderStatus: 'delivered'),
    FakeMyOrderModel(
        name: 'Havit HV-H2116D',
        price: '23.00',
        productImage: Image.asset(
                'assets/images/demo_images/product_categories/item3.png')
            .image,
        dateText: '26 Dec, 2021',
        orderStatus: 'processing'),
    FakeMyOrderModel(
        name: 'KWG Taurus M1',
        price: '23.00',
        productImage:
            Image.asset('assets/images/demo_images/my_orders/image3.png').image,
        dateText: '26 Dec, 2021',
        orderStatus: 'cancelled'),
    FakeMyOrderModel(
        name: 'Havit HV-H2002D',
        price: '23.00',
        productImage:
            Image.asset('assets/images/demo_images/my_orders/image4.png').image,
        dateText: '26 Dec, 2021',
        orderStatus: 'delivered'),
  ];

  /// Recently my bought product
  static List<FakeRecentPaymentProduct> recentPaymentProducts = [
    FakeRecentPaymentProduct(
        productName: 'Sennheiser Headphones',
        paymentDateTimeText: '30 Sep 2021, 11:59am',
        priceText: '129.00',
        itemCount: 3,
        productImage:
            Image.asset('assets/images/demo_images/recent_payment/image1.png')
                .image),
    FakeRecentPaymentProduct(
        productName: 'JBL Headphones',
        paymentDateTimeText: '30 Sep 2021, 11:59am',
        priceText: '129.00',
        itemCount: 3,
        productImage:
            Image.asset('assets/images/demo_images/recent_payment/image2.png')
                .image),
    FakeRecentPaymentProduct(
        productName: 'Beats Headphones',
        paymentDateTimeText: '30 Sep 2021, 11:59am',
        priceText: '129.00',
        itemCount: 3,
        productImage:
            Image.asset('assets/images/demo_images/recent_payment/image3.png')
                .image),
    FakeRecentPaymentProduct(
        productName: 'Bose Headphones',
        paymentDateTimeText: '30 Sep 2021, 11:59am',
        priceText: '129.00',
        itemCount: 3,
        productImage:
            Image.asset('assets/images/demo_images/recent_payment/image4.png')
                .image),
  ];

  /// Recent transactions
  static List<FakeRecentTransaction> recentTransactions = [
    FakeRecentTransaction(
        title: '#ECO52597',
        itemCount: 4,
        dateText: '23 July, 2021',
        timeText: '10:30 pm',
        amountText: '6.80',
        transactionType: 'earning-up'),
    FakeRecentTransaction(
        title: '#ECO84585',
        itemCount: 4,
        dateText: '23 July, 2021',
        timeText: '10:30 pm',
        amountText: '6.80',
        transactionType: 'earning-down'),
    FakeRecentTransaction(
        title: 'Send to bank',
        itemCount: 4,
        dateText: '23 July, 2021',
        timeText: '10:30 pm',
        amountText: '6.80',
        transactionType: 'send-to-bank')
  ];
}
