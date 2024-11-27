import 'package:ecomikstoreapp/screens/add_product_screen.dart';
import 'package:ecomikstoreapp/screens/call_screen.dart';
import 'package:ecomikstoreapp/screens/chat_deliveryman_screen.dart';
import 'package:ecomikstoreapp/screens/congratulation_screen.dart';
import 'package:ecomikstoreapp/screens/delivery_info_map_screen.dart';
import 'package:ecomikstoreapp/screens/delivery_info_screen.dart';
import 'package:ecomikstoreapp/screens/edit_account_screen.dart';
import 'package:ecomikstoreapp/screens/edit_product_screen.dart';
import 'package:ecomikstoreapp/screens/fake_sign_up_screen.dart';
import 'package:ecomikstoreapp/screens/home_navigator_screen.dart';
import 'package:ecomikstoreapp/screens/insight_screen.dart';
import 'package:ecomikstoreapp/screens/intro_screen.dart';
import 'package:ecomikstoreapp/screens/langauge_screen.dart';
import 'package:ecomikstoreapp/screens/my_wallet_screen.dart';
import 'package:ecomikstoreapp/screens/password_change_success_screen.dart';
import 'package:ecomikstoreapp/screens/password_recovery_screens/password_recovery_create_password_screen.dart';
import 'package:ecomikstoreapp/screens/password_recovery_screens/password_recovery_prompt_screen.dart';
import 'package:ecomikstoreapp/screens/password_recovery_screens/password_recovery_select_screen.dart';
import 'package:ecomikstoreapp/screens/password_recovery_screens/password_recovery_verification_screen.dart';
import 'package:ecomikstoreapp/screens/send_to_bank_screen.dart';
import 'package:ecomikstoreapp/screens/settings_screen.dart';
import 'package:ecomikstoreapp/screens/sign_in_screen.dart';
import 'package:ecomikstoreapp/screens/sign_up_success_screen.dart';
import 'package:ecomikstoreapp/screens/splash_screen.dart';
import 'package:ecomikstoreapp/screens/store_not_approved_yet.dart';
import 'package:ecomikstoreapp/screens/store_reviews_screen.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:flutter/material.dart';

import '../screens/Country_screen.dart';
import '../screens/Delivery_service.dart';
import '../screens/Support_ticket_screen.dart';
import '../screens/add_auction1st.dart';
import '../screens/add_auction2nd.dart';
import '../screens/add_auction3rd.dart';
import '../screens/add_bank_screen.dart';
import '../screens/add_card_screen.dart';
import '../screens/add_paypal.dart';
import '../screens/add_product1st.dart';
import '../screens/add_product2nd.dart';
import '../screens/add_product3rd.dart';
import '../screens/card_place_successful.dart';
import '../screens/currency_screen.dart';
import '../screens/deliveries.dart';
import '../screens/payment_summary.dart';
import '../screens/pick_up_confirmd.dart';
import '../screens/pickup_request.dart';
import '../screens/pickup_second.dart';
import '../screens/pickup_thired.dart';
import '../screens/seller_reg.dart';
import '../screens/setup_store_info.dart';
import '../screens/support_Ticket_create.dart';
import '../screens/terms_condition.dart';
import '../screens/tracking_order.dart';

/// This file contains app route generator
class AppRouteGenerator {
  /// This function generate routes corresponding to their pages with parameters
  /// (if used)
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Get.toNamed
    final Object? argument = settings.arguments;
    switch (settings.name) {
      case AppPageNames.rootScreen:
      case AppPageNames.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppPageNames.introScreen:
        return MaterialPageRoute(builder: (_) => const IntroScreen());
      case AppPageNames.homeNavigatorScreen:
        return MaterialPageRoute(builder: (_) => const HomeNavigatorScreen());
      case AppPageNames.signInScreen:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case AppPageNames.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case AppPageNames.addActionScreen:
        return MaterialPageRoute(builder: (_) => const AddAuction1stScreen());
      case AppPageNames.trackOrderScreen:
        return MaterialPageRoute(builder: (_) => const TrackOrderScreen());
      case AppPageNames.signUpSuccessScreen:
        return MaterialPageRoute(builder: (_) => const SignUpSuccessScreen());
      case AppPageNames.deliveryService:
        return MaterialPageRoute(builder: (_) => const DeliveryService());
      case AppPageNames.deliveries:
        return MaterialPageRoute(builder: (_) => const Deliveries());
      case AppPageNames.pickupConfirm:
        return MaterialPageRoute(builder: (_) => const PickupConfirm());
      case AppPageNames.addProduct3rdScreen:
        return MaterialPageRoute(builder: (_) => const AddProductThirdScreen());
      case AppPageNames.pickupSecondScreen:
        return MaterialPageRoute(builder: (_) => const PickupSecondScreen());
      case AppPageNames.pickupThirdScreen:
        return MaterialPageRoute(builder: (_) => const PickupThirdScreen());
      case AppPageNames.termsConditionScreen:
        return MaterialPageRoute(builder: (_) => const TermsConditionScreen());
      case AppPageNames.addActionThirdScreen:
        return MaterialPageRoute(builder: (_) => const AddActionThirdScreen());
      case AppPageNames.paymentSumScreen:
        return MaterialPageRoute(builder: (_) => const PaymentSumScreen());
      case AppPageNames.addProduct1stScreen:
        return MaterialPageRoute(builder: (_) => const AddProduct1stScreen());
      case AppPageNames.addProduct2ndScreen:
        return MaterialPageRoute(
            builder: (_) => const AddProductSecondScreen());
      case AppPageNames.addActionSecondScreen:
        return MaterialPageRoute(builder: (_) => const AddAuction2ndScreen());
      case AppPageNames.addCardScreen:
        return MaterialPageRoute(builder: (_) => const AddCardScreen());
      case AppPageNames.cardPlacedSuccessScreen:
        return MaterialPageRoute(
            builder: (_) => const CardPlacedSuccessScreen());
      case AppPageNames.addPaypalScreen:
        return MaterialPageRoute(builder: (_) => const AddPaypalScreen());
      case AppPageNames.pickupScreen:
        return MaterialPageRoute(builder: (_) => const PickupScreen());
      case AppPageNames.addBankScreen:
        return MaterialPageRoute(builder: (_) => const AddBankScreen());
      case AppPageNames.passwordChangeSuccessScreen:
        return MaterialPageRoute(
            builder: (_) => const PasswordChangSuccessScreen());
      case AppPageNames.storeNotApprovedYetScreen:
        return MaterialPageRoute(
            builder: (_) => const StoreNotApprovedYetWarningScreen());
      case AppPageNames.passwordRecoveryPromptScreen:
        return MaterialPageRoute(
            builder: (_) => const PasswordRecoveryPromptScreen());
      case AppPageNames.passwordRecoveryVerificationScreen:
        return MaterialPageRoute(
            builder: (_) => const PasswordRecoveryVerificationScreen());
      case AppPageNames.passwordRecoverySelectScreen:
        return MaterialPageRoute(
            builder: (_) => const PasswordRecoverySelectScreen());
      case AppPageNames.passwordRecoveryCreateScreen:
        return MaterialPageRoute(
            builder: (_) => const PasswordRecoveryCreatePasswordScreen());
      case AppPageNames.settingsScreen:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case AppPageNames.languageScreen:
        return MaterialPageRoute(builder: (_) => const LanguageScreen());
      case AppPageNames.setupStoreInfoScreen:
        return MaterialPageRoute(builder: (_) => const SetupStoreInfoScreen());
      case AppPageNames.countryScreen:
        return MaterialPageRoute(builder: (_) => const CountryScreen());
      case AppPageNames.currencyScreen:
        return MaterialPageRoute(builder: (_) => const CurrencyScreen());
      case AppPageNames.storeRegScreen:
        return MaterialPageRoute(builder: (_) => const StoreRegScreen());
      case AppPageNames.myWalletScreen:
        return MaterialPageRoute(builder: (_) => const MyWalletScreen());
      case AppPageNames.supportScreen:
        return MaterialPageRoute(builder: (_) => const SupportScreen());
      case AppPageNames.supportTicketScreen:
        return MaterialPageRoute(
            builder: (_) => const SupportTicketCreateScreen());
      case AppPageNames.editAccountScreen:
        return MaterialPageRoute(builder: (_) => const EditAccountScreen());
      case AppPageNames.storeReviewsScreen:
        return MaterialPageRoute(builder: (_) => const StoreReviewsScreen());
      case AppPageNames.congratulationScreen:
        return MaterialPageRoute(builder: (_) => const CongratulationScreen());
      case AppPageNames.editProductScreen:
        return MaterialPageRoute(
            builder: (_) => EditProductScreen(product: argument));
      case AppPageNames.addProductScreen:
        return MaterialPageRoute(builder: (_) => const AddProductScreen());
      case AppPageNames.deliveryInfoScreen:
        return MaterialPageRoute(builder: (_) => const DeliveryInfoScreen());
      case AppPageNames.deliveryInfoMapScreen:
        return MaterialPageRoute(builder: (_) => const DeliveryInfoMapScreen());
      case AppPageNames.chatWithDeliverymanScreen:
        return MaterialPageRoute(builder: (_) => const ChatDeliverymanScreen());
      case AppPageNames.insightScreen:
        return MaterialPageRoute(builder: (_) => const InsightScreen());
      case AppPageNames.sendToBankScreen:
        return MaterialPageRoute(builder: (_) => const SendToBankScreen());
      case AppPageNames.callScreen:
        return MaterialPageRoute(builder: (_) => const CallScreen());
      default:
        // Open this page if wrong route address used
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                body: SafeArea(child: Center(child: Text('Page not found')))));
    }
  }
}
