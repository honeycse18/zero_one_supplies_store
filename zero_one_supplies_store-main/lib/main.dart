import 'dart:convert';
import 'dart:developer';

import 'package:ecomikstoreapp/utils/app_pages.dart';
import 'package:ecomikstoreapp/utils/app_singleton.dart';
import 'package:ecomikstoreapp/utils/constants/app_page_names.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:ecomikstoreapp/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await GetStorage.init();
  await Hive.initFlutter();
  await AppSingleton.instance.initialize();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await LocalNotificationService.initialize();
  // FirebaseMessaging.onMessage.listen(_onForegroundHandler);
  // FirebaseMessaging.onBackgroundMessage(_onBackgroundHandler);
  runApp(const ZeroOneVendorsApp());
}

Future<void> _onForegroundHandler(RemoteMessage remoteMessage) async {
  log(remoteMessage.toMap().toString());
  try {
    await Helper.showNotification(
        title: remoteMessage.notification?.title ?? '',
        message: remoteMessage.notification?.body ?? '',
        payload: jsonEncode(remoteMessage.data));
  } catch (e) {
    await Helper.showNotification(
        title: remoteMessage.notification?.title ?? '',
        message: remoteMessage.notification?.body ?? '',
        payload: remoteMessage.data.toString());
  }
}

Future<void> _onBackgroundHandler(RemoteMessage remoteMessage) async {
  log(remoteMessage.toMap().toString());
  try {
    await Helper.showNotification(
        title: remoteMessage.notification?.title ?? '',
        message: remoteMessage.notification?.body ?? '',
        payload: jsonEncode(remoteMessage.data));
  } catch (e) {
    await Helper.showNotification(
        title: remoteMessage.notification?.title ?? '',
        message: remoteMessage.notification?.body ?? '',
        payload: remoteMessage.data.toString());
  }
}

class ZeroOneVendorsApp extends StatelessWidget {
  const ZeroOneVendorsApp({super.key});

  // This widget is the root of this app.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '01 Vendors',
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      unknownRoute: AppPages.unknownScreenPageRoute,
      // onGenerateRoute: AppRouteGenerator.generateRoute,
      initialRoute: AppPageNames.rootScreen,
      theme: AppThemeData.appThemeData,
    );
  }
}
