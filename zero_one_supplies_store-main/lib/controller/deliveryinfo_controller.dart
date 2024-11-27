import 'dart:developer';

import 'package:ecomikstoreapp/models/api_responses/order_details_response.dart';
import 'package:ecomikstoreapp/utils/api_repo.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';
import 'package:get/get.dart';

class DeliveryInfoScreenController extends GetxController {
  String orderID = '';
  OrderDetails orderDetails = OrderDetails.empty();

  Future<void> getOrderDetails(String orderID) async {
    final OrderDetailsResponse? response =
        await APIRepo.fetchOrderDetails(orderID);
    if (response == null) {
      APIHelper.onError(response?.msg);
      return;
    } else if (response.error) {
      APIHelper.onFailure(response.msg);
      return;
    }
    log(response.toJson().toString());
    _onSuccessGetOrderDetails(response);
  }

  _onSuccessGetOrderDetails(OrderDetailsResponse response) {
    orderDetails = response.data;
    update();
  }

  void _getScreenParameter() {
    final argument = Get.arguments;
    if (argument is String) {
      orderID = argument;
    }
  }

  @override
  void onInit() {
    _getScreenParameter();
    getOrderDetails(orderID);
    super.onInit();
  }
}
