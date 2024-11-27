import 'dart:developer';

import 'package:ecomikstoreapp/models/api_responses/chat_users_response.dart';
import 'package:ecomikstoreapp/utils/constants/app_constants.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class MessageRecipientsScreenController extends GetxController {
  List<ChatUser> chatUsers = [];
  IO.Socket socket = IO.io(
      '${Constants.appBaseURL}messages',
      IO.OptionBuilder()
          .setAuth({'token': Helper.getUserToken()}).setTransports(
              ['websocket']) // for Flutter or Dart VM
          .build());

  dynamic onUserList(dynamic data) {
    chatUsers = APIHelper.getSafeListValue(data)
        .map((e) => ChatUser.getAPIResponseObjectSafeValue(e))
        .toList();
    update();
  }

  void initSocket() {
    socket.on('users', onUserList);
    socket.onConnect((data) {
      log('data');
    });
    /* socket.onConnect((_) {
      print('Connection established');
    });
    socket.onDisconnect((_) => print('Connection Disconnection'));
    socket.onConnectError((err) => print(err));
    socket.onError((err) => print(err)); */
    socket.onConnectError((data) {
      log('data'.toString());
    });
    socket.onConnecting((data) {
      log('data'.toString());
    });
    socket.onConnectTimeout((data) {
      log('data');
    });
    socket.onReconnectAttempt((data) {
      log('data');
    });
    socket.onReconnect((data) {
      log('data');
    });
    socket.onReconnectFailed((data) {
      log('data');
    });
    socket.onReconnectError((data) {
      log('data');
    });
    socket.onError((data) {
      log('data');
    });
    socket.onDisconnect((data) {
      log('data');
    });
    socket.onPing((data) {
      log('data');
    });
    socket.onPong((data) {
      log('data');
    });
  }

  @override
  void onInit() {
    initSocket();
    super.onInit();
  }

  @override
  void onClose() {
    socket.disconnect();
    socket.dispose();
    super.onClose();
  }
}
