import 'package:ecomikstoreapp/screens/Country_screen.dart';
import 'package:ecomikstoreapp/screens/Delivery_service.dart';
import 'package:ecomikstoreapp/screens/Support_ticket_screen.dart';
import 'package:ecomikstoreapp/screens/account_create_successfull.dart';
import 'package:ecomikstoreapp/screens/add_auction1st.dart';
import 'package:ecomikstoreapp/screens/add_auction2nd.dart';
import 'package:ecomikstoreapp/screens/add_auction3rd.dart';
import 'package:ecomikstoreapp/screens/add_bank_screen.dart';
import 'package:ecomikstoreapp/screens/add_card_screen.dart';
import 'package:ecomikstoreapp/screens/add_coupon.dart';
import 'package:ecomikstoreapp/screens/add_paypal.dart';
import 'package:ecomikstoreapp/screens/add_product1st.dart';
import 'package:ecomikstoreapp/screens/add_product2nd.dart';
import 'package:ecomikstoreapp/screens/add_product3rd.dart';
import 'package:ecomikstoreapp/screens/add_product_screen.dart';
import 'package:ecomikstoreapp/screens/call_screen.dart';
import 'package:ecomikstoreapp/screens/card_place_successful.dart';
import 'package:ecomikstoreapp/screens/chat_deliveryman_screen.dart';
import 'package:ecomikstoreapp/screens/chat_recipients_screen.dart';
import 'package:ecomikstoreapp/screens/chat_screen.dart';
import 'package:ecomikstoreapp/screens/congratulation_screen.dart';
import 'package:ecomikstoreapp/screens/coupons_screen.dart';
import 'package:ecomikstoreapp/screens/currency_screen.dart';
import 'package:ecomikstoreapp/screens/delete_account.dart';
import 'package:ecomikstoreapp/screens/deliveries.dart';
import 'package:ecomikstoreapp/screens/delivery_info_map_screen.dart';
import 'package:ecomikstoreapp/screens/delivery_info_screen.dart';
import 'package:ecomikstoreapp/screens/edit_account_screen.dart';
import 'package:ecomikstoreapp/screens/edit_product_screen.dart';
import 'package:ecomikstoreapp/screens/fake_sign_up_screen.dart';
import 'package:ecomikstoreapp/screens/home_navigator_screen.dart';
import 'package:ecomikstoreapp/screens/home_navigator_screens/add_brand_screen.dart';
import 'package:ecomikstoreapp/screens/home_navigator_screens/brand_screen.dart';

import 'package:ecomikstoreapp/screens/home_navigator_screens/home_screen.dart';
import 'package:ecomikstoreapp/screens/home_navigator_screens/my_account_screen.dart';
import 'package:ecomikstoreapp/screens/home_navigator_screens/orders_screen.dart';
import 'package:ecomikstoreapp/screens/home_navigator_screens/products_screen.dart';
import 'package:ecomikstoreapp/screens/image_zoom.dart';
import 'package:ecomikstoreapp/screens/insight_screen.dart';
import 'package:ecomikstoreapp/screens/intro_screen.dart';
import 'package:ecomikstoreapp/screens/langauge_screen.dart';
import 'package:ecomikstoreapp/screens/my_wallet_screen.dart';
import 'package:ecomikstoreapp/screens/password_change_success_screen.dart';
import 'package:ecomikstoreapp/screens/password_recovery_screens/password_recovery_create_password_screen.dart';
import 'package:ecomikstoreapp/screens/password_recovery_screens/password_recovery_email_prompt_screen.dart';
import 'package:ecomikstoreapp/screens/password_recovery_screens/password_recovery_prompt_screen.dart';
import 'package:ecomikstoreapp/screens/password_recovery_screens/password_recovery_select_screen.dart';
import 'package:ecomikstoreapp/screens/password_recovery_screens/password_recovery_verification_screen.dart';
import 'package:ecomikstoreapp/screens/payment_summary.dart';
import 'package:ecomikstoreapp/screens/pick_up_confirmd.dart';
import 'package:ecomikstoreapp/screens/pickup_request.dart';
import 'package:ecomikstoreapp/screens/pickup_second.dart';
import 'package:ecomikstoreapp/screens/pickup_thired.dart';
import 'package:ecomikstoreapp/screens/requested_offer.dart';
import 'package:ecomikstoreapp/screens/seller_reg.dart';
import 'package:ecomikstoreapp/screens/send_to_bank_screen.dart';
import 'package:ecomikstoreapp/screens/set_store_location.dart';
import 'package:ecomikstoreapp/screens/settings_screen.dart';
import 'package:ecomikstoreapp/screens/setup_store_info.dart';
import 'package:ecomikstoreapp/screens/sign_in_screen.dart';
import 'package:ecomikstoreapp/screens/sign_up_success_screen.dart';
import 'package:ecomikstoreapp/screens/stock_managmnent_screen.dart';
import 'package:ecomikstoreapp/screens/store_not_approved_yet.dart';
import 'package:ecomikstoreapp/screens/store_reviews_screen.dart';
import 'package:ecomikstoreapp/screens/support_Ticket_create.dart';
import 'package:ecomikstoreapp/screens/terms_condition.dart';
import 'package:ecomikstoreapp/screens/tracking_order.dart';
import 'package:ecomikstoreapp/screens/unknown_screen.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:get/get.dart';

import '../screens/splash_screen.dart';

class AppPages {
  static final List<GetPage<dynamic>> pages = [
    GetPage(name: AppPageNames.rootScreen, page: () => const SplashScreen()),
    GetPage(name: AppPageNames.splashScreen, page: () => const SplashScreen()),
    GetPage(name: AppPageNames.introScreen, page: () => const IntroScreen()),
    GetPage(
        name: AppPageNames.homeNavigatorScreen,
        page: () => const HomeNavigatorScreen()),
    GetPage(name: AppPageNames.homeScreen, page: () => const HomeScreen()),
    GetPage(name: AppPageNames.signInScreen, page: () => const SignInScreen()),
    GetPage(name: AppPageNames.signUpScreen, page: () => const SignUpScreen()),
    GetPage(
        name: AppPageNames.stockManagementScreen,
        page: () => const StockManagementScreen()),
    GetPage(
        name: AppPageNames.myAccountScreen,
        page: () => const MyAccountScreen()),
    GetPage(name: AppPageNames.ordersScreen, page: () => const OrdersScreen()),
    GetPage(
        name: AppPageNames.addBrandScreen, page: () => const AddBrandScreen()),
    GetPage(
        name: AppPageNames.productsScreen, page: () => const ProductsScreen()),
    GetPage(
        name: AppPageNames.addActionScreen,
        page: () => const AddAuction1stScreen()),
    GetPage(
        name: AppPageNames.trackOrderScreen,
        page: () => const TrackOrderScreen()),
    GetPage(name: AppPageNames.brandsScreen, page: () => const BrandsScreen()),
    GetPage(
        name: AppPageNames.signUpSuccessScreen,
        page: () => const SignUpSuccessScreen()),
    GetPage(
        name: AppPageNames.deliveryService,
        page: () => const DeliveryService()),
    GetPage(name: AppPageNames.deliveries, page: () => const Deliveries()),
    GetPage(
        name: AppPageNames.pickupConfirm, page: () => const PickupConfirm()),
    GetPage(
        name: AppPageNames.addProduct3rdScreen,
        page: () => const AddProductThirdScreen()),
    GetPage(
        name: AppPageNames.pickupSecondScreen,
        page: () => const PickupSecondScreen()),
    GetPage(
        name: AppPageNames.pickupThirdScreen,
        page: () => const PickupThirdScreen()),
    GetPage(
        name: AppPageNames.termsConditionScreen,
        page: () => const TermsConditionScreen()),
    GetPage(
        name: AppPageNames.addActionThirdScreen,
      page: () => const AddActionThirdScreen()),
    GetPage(
        name: AppPageNames.requestedOfferScreen,
        page: () => const RequestedOfferScreen()),
    GetPage(
        name: AppPageNames.paymentSumScreen,
        page: () => const PaymentSumScreen()),
    GetPage(
        name: AppPageNames.addProduct1stScreen,
        page: () => const AddProduct1stScreen()),
    GetPage(
        name: AppPageNames.addProduct2ndScreen,
        page: () => const AddProductSecondScreen()),
    GetPage(
        name: AppPageNames.addActionSecondScreen,
        page: () => const AddAuction2ndScreen()),
            GetPage(
        name: AppPageNames.deleteAccountScreen,
        page: () => const DeleteAccountScreen()),
    GetPage(
        name: AppPageNames.addCardScreen, page: () => const AddCardScreen()),
    GetPage(
        name: AppPageNames.cardPlacedSuccessScreen,
        page: () => const CardPlacedSuccessScreen()),
    GetPage(
        name: AppPageNames.addPaypalScreen,
        page: () => const AddPaypalScreen()),
    GetPage(
        name: AppPageNames.accountCreateSuccessful,
        page: () => const AccountCreateSuccessful()),
    GetPage(name: AppPageNames.pickupScreen, page: () => const PickupScreen()),
    GetPage(
        name: AppPageNames.addBankScreen, page: () => const AddBankScreen()),
    GetPage(
        name: AppPageNames.passwordChangeSuccessScreen,
        page: () => const PasswordChangSuccessScreen()),
    GetPage(
        name: AppPageNames.storeNotApprovedYetScreen,
        page: () => const StoreNotApprovedYetWarningScreen()),
    GetPage(
        name: AppPageNames.passwordRecoveryPromptScreen,
        page: () => const PasswordRecoveryPromptScreen()),
    GetPage(
        name: AppPageNames.passwordRecoveryEmailPromptScreen,
        page: () => const PasswordRecoveryEmailPromptScreen()),
    GetPage(
        name: AppPageNames.passwordRecoveryVerificationScreen,
        page: () => const PasswordRecoveryVerificationScreen()),
    GetPage(
        name: AppPageNames.passwordRecoverySelectScreen,
        page: () => const PasswordRecoverySelectScreen()),
    GetPage(
        name: AppPageNames.passwordRecoveryCreateScreen,
        page: () => const PasswordRecoveryCreatePasswordScreen()),
    GetPage(
        name: AppPageNames.settingsScreen, page: () => const SettingsScreen()),
    GetPage(
        name: AppPageNames.languageScreen, page: () => const LanguageScreen()),
    GetPage(
        name: AppPageNames.setupStoreInfoScreen,
        page: () => const SetupStoreInfoScreen()),
    GetPage(
        name: AppPageNames.countryScreen, page: () => const CountryScreen()),
    GetPage(
        name: AppPageNames.currencyScreen, page: () => const CurrencyScreen()),
    GetPage(
        name: AppPageNames.storeRegScreen, page: () => const StoreRegScreen()),
    GetPage(
        name: AppPageNames.myWalletScreen, page: () => const MyWalletScreen()),
    GetPage(
        name: AppPageNames.supportScreen, page: () => const SupportScreen()),
    GetPage(
        name: AppPageNames.congratulationScreen,
        page: () => const CongratulationScreen()),
    GetPage(
        name: AppPageNames.supportTicketScreen,
        page: () => const SupportTicketCreateScreen()),
    GetPage(
        name: AppPageNames.editAccountScreen,
        page: () => const EditAccountScreen()),
    GetPage(
        name: AppPageNames.storeReviewsScreen,
        page: () => const StoreReviewsScreen()),
    GetPage(
        name: AppPageNames.congratulationScreen,
        page: () => const CongratulationScreen()),
    GetPage(
        name: AppPageNames.editProductScreen,
        page: () => const EditProductScreen()),
    GetPage(
        name: AppPageNames.addProductScreen,
        page: () => const AddProductScreen()),
    GetPage(
        name: AppPageNames.deliveryInfoScreen,
        page: () => const DeliveryInfoScreen()),
    GetPage(
        name: AppPageNames.deliveryInfoMapScreen,
        page: () => const DeliveryInfoMapScreen()),
    GetPage(
        name: AppPageNames.chatWithDeliverymanScreen,
        page: () => const ChatDeliverymanScreen()),
    GetPage(
        name: AppPageNames.insightScreen, page: () => const InsightScreen()),
    GetPage(
        name: AppPageNames.sendToBankScreen,
        page: () => const SendToBankScreen()),
    GetPage(name: AppPageNames.callScreen, page: () => const CallScreen()),
    GetPage(name: AppPageNames.chatScreen, page: () => const ChatScreen()),
    GetPage(
        name: AppPageNames.chatRecipientScreen,
        page: () => const ChatRecipientsScreen()),
    GetPage(
        name: AppPageNames.imageScreen, page: () => const ImageZoomScreen()),
    GetPage(
        name: AppPageNames.couponsScreen, page: () => const CouponsScreen()),
    GetPage(
        name: AppPageNames.addCouponScreen,
        page: () => const AddCouponScreen()),
    GetPage(
        name: AppPageNames.setStoreLocationScreen,
        page: () => const SetStoreLocationScreen()),
  ];

  static final GetPage<dynamic> unknownScreenPageRoute = GetPage(
      name: AppPageNames.unknownScreen, page: () => const UnknownScreen());
}
