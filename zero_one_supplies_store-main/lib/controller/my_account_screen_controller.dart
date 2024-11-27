import 'package:ecomikstoreapp/models/api_responses/vendor_with_store_details_response.dart';
import 'package:ecomikstoreapp/utils/helpers/helpers.dart';
import 'package:get/get.dart';

class MyAccountScreenController extends GetxController {
  VendorDetails vendorAccountDetails = VendorDetails.empty();

  getVendorAccountDetails() {
    vendorAccountDetails = Helper.getVendor();
    update();
  }

  @override
  void onInit() {
    getVendorAccountDetails();
    super.onInit();
  }
}
