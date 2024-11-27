import 'dart:convert';
import 'dart:io';

import 'package:ecomikstoreapp/models/api_responses/add_product_initial_response.dart';
import 'package:ecomikstoreapp/models/api_responses/all_orders_response.dart';
import 'package:ecomikstoreapp/models/api_responses/auctions_response.dart';
import 'package:ecomikstoreapp/models/api_responses/brand_list_api_response.dart';
import 'package:ecomikstoreapp/models/api_responses/chat_recipients.dart';
import 'package:ecomikstoreapp/models/api_responses/child_categories_response.dart';
import 'package:ecomikstoreapp/models/api_responses/core_api_responses/raw_api_response.dart';
import 'package:ecomikstoreapp/models/api_responses/coupon_list_response.dart';
import 'package:ecomikstoreapp/models/api_responses/dash_board_response.dart';
import 'package:ecomikstoreapp/models/api_responses/edit_accound_response.dart';
import 'package:ecomikstoreapp/models/api_responses/edit_brand_response.dart';
import 'package:ecomikstoreapp/models/api_responses/insight_details_response.dart';
import 'package:ecomikstoreapp/models/api_responses/language_translations_response.dart';
import 'package:ecomikstoreapp/models/api_responses/languages_response.dart';
import 'package:ecomikstoreapp/models/api_responses/order_details_response.dart';
import 'package:ecomikstoreapp/models/api_responses/otp_verify_response.dart';
import 'package:ecomikstoreapp/models/api_responses/pickup_stations_response.dart';
import 'package:ecomikstoreapp/models/api_responses/product_add_subcategories_response.dart';
import 'package:ecomikstoreapp/models/api_responses/product_details_response.dart';
import 'package:ecomikstoreapp/models/api_responses/product_elements_response.dart';
import 'package:ecomikstoreapp/models/api_responses/products_response.dart';
import 'package:ecomikstoreapp/models/api_responses/requested_offer_list_ressponse.dart';
import 'package:ecomikstoreapp/models/api_responses/reset_password_create_new_password_response.dart';
import 'package:ecomikstoreapp/models/api_responses/reset_password_otp_response.dart';
import 'package:ecomikstoreapp/models/api_responses/review_count_response.dart';
// import 'package:ecomikstoreapp/models/api_responses/send_otp_response.dart';
import 'package:ecomikstoreapp/models/api_responses/sign_in_response.dart';
import 'package:ecomikstoreapp/models/api_responses/sign_up_otp_verification_response.dart';
import 'package:ecomikstoreapp/models/api_responses/sign_up_response.dart';
import 'package:ecomikstoreapp/models/api_responses/single_image_upload_response.dart';
import 'package:ecomikstoreapp/models/api_responses/site_settings_response.dart';
import 'package:ecomikstoreapp/models/api_responses/store_categories_response.dart';
import 'package:ecomikstoreapp/models/api_responses/store_reviews_response.dart';
import 'package:ecomikstoreapp/models/api_responses/term_condition_response.dart';
import 'package:ecomikstoreapp/models/api_responses/vendor_with_store_details_response.dart';
import 'package:ecomikstoreapp/utils/api_client.dart';
import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;

class APIRepo {
  static Future<SignInResponse?> login(String requestJsonString) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      // final Map<String, String> queries = {'page': '$pageNumber'};
      final Response response =
          await apiHttpClient.post('api/user/login', body: requestJsonString);

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final SignInResponse responseModel =
          SignInResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<SignUpResponse?> signUp(String requestJsonString) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      final Response response = await apiHttpClient
          .post('api/user/registration/vendor', body: requestJsonString);

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final SignUpResponse responseModel =
          SignUpResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<RawAPIResponse?> deleteAccount() async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      final Response response = await apiHttpClient.delete(
          'api/user/temporary-delete',
          headers: APIHelper.getAuthHeaderMap());

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final RawAPIResponse responseModel =
          RawAPIResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<DashBoardResponse?> getDashBoardResponse() async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found

      await APIHelper.preAPICallCheck();
      // final Map<String, String> queries = {'page': '$page'};

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      final Response response = await apiHttpClient.get(
          'api/user/vendor/dashboard',
          headers: APIHelper.getAuthHeaderMap());

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final DashBoardResponse responseModel =
          DashBoardResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<InsightDetailsResponse?> getInsightResponse(
      String storeID) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found

      await APIHelper.preAPICallCheck();
      final Map<String, String> queries = {'store': storeID};

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      final Response response = await apiHttpClient.get(
          'api/frontend/vendor-dashboard',
          query: queries,
          headers: APIHelper.getAuthHeaderMap());

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final InsightDetailsResponse responseModel =
          InsightDetailsResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<VendorDetailsResponse?> getVendorDetails(
      {String token = ''}) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      final Response response = await apiHttpClient.get(
          'api/user/vendor/verify',
          headers: token.isNotEmpty
              ? {'Authorization': 'Bearer $token'}
              : APIHelper.getAuthHeaderMap());

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final VendorDetailsResponse responseModel =
          VendorDetailsResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<EditAccountResponse?> editAccount(
      String requestJsonString) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      final Response response = await apiHttpClient.post('api/user/update',
          body: requestJsonString, headers: APIHelper.getAuthHeaderMap());

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final EditAccountResponse responseModel =
          EditAccountResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<EditBrandResponse?> editBrand(String requestJsonString) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      final Response response = await apiHttpClient.post('api/product/brand',
          body: requestJsonString, headers: APIHelper.getAuthHeaderMap());

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final EditBrandResponse responseModel =
          EditBrandResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<ProductDetailsResponse?> getProductDetails(
      String productID) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();
      final Map<String, String> queries = {'_id': productID};

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      final Response response = await apiHttpClient.get('api/product/list',
          query: queries, headers: APIHelper.getAuthHeaderMap());

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final ProductDetailsResponse responseModel =
          ProductDetailsResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<ProductElementsResponse?> getProductElements() async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      final Response response = await apiHttpClient.get('api/product/elements',
          headers: APIHelper.getAuthHeaderMap());

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final ProductElementsResponse responseModel =
          ProductElementsResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<ProductElementSubcategoriesResponse?>
      getProductSubcategoryElements(int page, String categoryID) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      final Map<String, String> queries = {
        'page': '$page',
        'parent': categoryID
      };
      final Response response = await apiHttpClient.get(
          'api/product/categories',
          headers: APIHelper.getAuthHeaderMap(),
          query: queries);

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final ProductElementSubcategoriesResponse responseModel =
          ProductElementSubcategoriesResponse.getAPIResponseObjectSafeValue(
              response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<ChildCategoriesResponse?> getChildCategories(
      int page, String subcategoryID) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      final Map<String, String> queries = {
        'page': '$page',
        'subcategory': subcategoryID
      };
      final Response response = await apiHttpClient.get(
          'api/product/child-categories',
          headers: APIHelper.getAuthHeaderMap(),
          query: queries);

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final ChildCategoriesResponse responseModel =
          ChildCategoriesResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<ReviewCountResponse?> getReviewCount(String id) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();
      final Map<String, String> queries = {'_id': id};

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      final Response response = await apiHttpClient.get('api/store',
          query: queries, headers: APIHelper.getAuthHeaderMap());

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final ReviewCountResponse responseModel =
          ReviewCountResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<ProductsResponse?> getProducts(int page,
      [String search = '']) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();
      final Map<String, String> queries = {'page': '$page'};
      if (search.isNotEmpty) {
        queries['search'] = search;
      }

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      final Response response = await apiHttpClient.get(
          'api/product/vendor/short-info-list',
          query: queries,
          headers: APIHelper.getAuthHeaderMap());

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final ProductsResponse responseModel =
          ProductsResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<ProductsResponse?> getTrashProducts(int page,
      [String search = '']) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();
      final Map<String, String> queries = {'page': '$page'};
      if (search.isNotEmpty) {
        queries['search'] = search;
      }

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      final Response response = await apiHttpClient.get(
          'api/product/vendor/trash-list',
          query: queries,
          headers: APIHelper.getAuthHeaderMap());

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final ProductsResponse responseModel =
          ProductsResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<AuctionsResponse?> getAuctions(int page,
      [String search = '']) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();
      final Map<String, String> queries = {'page': '$page'};
      if (search.isNotEmpty) {
        queries['search'] = search;
      }

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      final Response response = await apiHttpClient.get(
          // 'api/product/auction/all'
          'api/product/auction/bid-list-vendor',
          query: queries,
          headers: APIHelper.getAuthHeaderMap());

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final AuctionsResponse responseModel =
          AuctionsResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<StoreReviewsResponse?> getStoreReview(
      int page, String storeId) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final Map<String, String> queries = {'page': '$page', '_id': storeId};

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      final Response response = await apiHttpClient.get(
          'api/store/product-reviews',
          query: queries,
          headers: APIHelper.getAuthHeaderMap());

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final StoreReviewsResponse responseModel =
          StoreReviewsResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<BrandListApiResponse?> getBrandList(int page) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final Map<String, String> queries = {'page': '$page'};

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      final Response response = await apiHttpClient.get(
          'api/product/brands/vendor',
          query: queries,
          headers: APIHelper.getAuthHeaderMap());

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final BrandListApiResponse responseModel =
          BrandListApiResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<ResetPasswordOtpResponse?> sendResetOtp(
      String requestJsonString) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      // final Map<String, String> queries = {'page': '$pageNumber'};
      final Response response = await apiHttpClient
          .post('api/user/send-reset-otp', body: requestJsonString);

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final ResetPasswordOtpResponse responseModel =
          ResetPasswordOtpResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<OtpVerifyResponse?> verifyOtpForResetPass(
      String requestJsonString) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      // final Map<String, String> queries = {'page': '$pageNumber'};
      final Response response = await apiHttpClient
          .post('api/user/verify-reset-otp', body: requestJsonString);

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final OtpVerifyResponse responseModel =
          OtpVerifyResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<StoreCategoriesResponse?> getStoreCategories(
      {String token = ''}) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      final Response response = await apiHttpClient.get('api/store/elements',
          headers: token.isNotEmpty
              ? {'Authorization': 'Bearer $token'}
              : APIHelper.getAuthHeaderMap());

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final StoreCategoriesResponse responseModel =
          StoreCategoriesResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<SingleImageUploadResponse?> uploadImage(File imageFile,
      {String imageFileName = '',
      String id = '',
      required String token}) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final String fileName;
      final formDataMap = <String, dynamic>{};
      if (imageFileName.isNotEmpty) {
        formDataMap['image_name'] =
            path.basenameWithoutExtension(imageFileName);
        fileName = imageFileName;
      } else {
        fileName = path.basename(imageFile.path);
      }
      if (id.isNotEmpty) {
        formDataMap['_id'] = id;
      }
      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      FormData formData = FormData({
        ...formDataMap,
        'image': MultipartFile(imageFile, filename: fileName),
      });
      final Response response = await apiHttpClient.post(
          'api/file/single-image-aws',
          body: formData,
          headers: token.isNotEmpty
              ? {'Authorization': 'Bearer $token'}
              : APIHelper.getAuthHeaderMap());

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final SingleImageUploadResponse responseModel =
          SingleImageUploadResponse.getAPIResponseObjectSafeValue(
              response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<TermsConditionResponse?> getTermsCondition(
      String requestJsonString) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      final Response response = await apiHttpClient.post('api/about-us/get-one',
          body: requestJsonString, headers: APIHelper.getAuthHeaderMap());

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final TermsConditionResponse responseModel =
          TermsConditionResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<ResetPasswordCreateNewPasswordResponse?> resetPassCreateNewPass(
      String requestJsonString, String authToken) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      // final Map<String, String> queries = {'page': '$pageNumber'};
      final Response response = await apiHttpClient.post(
          'api/user/password-reset-by-otp',
          body: requestJsonString,
          headers: {'Authorization': 'Bearer $authToken'});

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final ResetPasswordCreateNewPasswordResponse responseModel =
          ResetPasswordCreateNewPasswordResponse.getAPIResponseObjectSafeValue(
              response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<RawAPIResponse?> sendVerifyVendorOTP(
      String requestJsonString) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      // final Map<String, String> queries = {'page': '$pageNumber'};
      final Response response = await apiHttpClient
          .post('api/user/signup-resend-otp', body: requestJsonString);

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final RawAPIResponse responseModel =
          RawAPIResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<RawAPIResponse?> storeVendorInfo(String requestJsonString,
      {String token = ''}) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      // final Map<String, String> queries = {'page': '$pageNumber'};
      final Response response = await apiHttpClient.post('api/store/setup-app',
          body: requestJsonString,
          headers: token.isNotEmpty
              ? {'Authorization': 'Bearer $token'}
              : APIHelper.getAuthHeaderMap());

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final RawAPIResponse responseModel =
          RawAPIResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<SignUpOtpVerificationResponse?> signUpOtpVerification(
      String requestJsonString) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      // final Map<String, String> queries = {'page': '$pageNumber'};
      final Response response = await apiHttpClient
          .post('api/user/signup-otp-verify', body: requestJsonString);

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final SignUpOtpVerificationResponse responseModel =
          SignUpOtpVerificationResponse.getAPIResponseObjectSafeValue(
              response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<StoreOrdersResponse?> getAllOrders(
      int page, String storeId, bool paymentStatus) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();
      final Map<String, String> queries = {'page': '$page', 'store': storeId};
      if (paymentStatus) {
        queries['payment'] = 'completed';
      } else {
        queries['payment'] = 'pending';
      }

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      final Response response = await apiHttpClient.get(
          'api/order/list-store-wise',
          query: queries,
          headers: APIHelper.getAuthHeaderMap());

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final StoreOrdersResponse responseModel =
          StoreOrdersResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<LanguageTranslationsResponse?>
      fetchLanguageTranslations() async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      final Response response = await apiHttpClient.get(
        'api/settings/language/translations',
        headers: APIHelper.getAuthHeaderMap(),
      );

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final LanguageTranslationsResponse responseModel =
          LanguageTranslationsResponse.getAPIResponseObjectSafeValue(
              response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<LanguagesResponse?> fetchLanguages() async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      final Response response = await apiHttpClient.get(
        'api/settings/all-languages',
        headers: APIHelper.getAuthHeaderMap(),
      );

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final LanguagesResponse responseModel =
          LanguagesResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<RawAPIResponse?> submitAddEditProductDetails(
      String requestJsonString) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      // final Map<String, String> queries = {'page': '$pageNumber'};
      final Response response = await apiHttpClient.post('api/product',
          body: requestJsonString, headers: APIHelper.getAuthHeaderMap());

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final RawAPIResponse responseModel =
          RawAPIResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<RawAPIResponse?> submitAddEditAuctionProductDetails(
      String requestJsonString) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      // final Map<String, String> queries = {'page': '$pageNumber'};
      final Response response = await apiHttpClient.post('api/product/auction',
          body: requestJsonString, headers: APIHelper.getAuthHeaderMap());

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final RawAPIResponse responseModel =
          RawAPIResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<AddProductInitialResponse?> addProductInitialPost(
      String requestJsonString) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      // final Map<String, String> queries = {'page': '$pageNumber'};
      final Response response = await apiHttpClient.post('api/product',
          body: requestJsonString, headers: APIHelper.getAuthHeaderMap());

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final AddProductInitialResponse responseModel =
          AddProductInitialResponse.getAPIResponseObjectSafeValue(
              response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<OrderDetailsResponse?> fetchOrderDetails(String orderID) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();
      final Map<String, String> queries = {'_id': orderID};

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      final Response response = await apiHttpClient.get('api/order',
          query: queries, headers: APIHelper.getAuthHeaderMap());

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final OrderDetailsResponse responseModel =
          OrderDetailsResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<SiteSettingsResponse?> getSiteSettings() async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      final Response response = await apiHttpClient.get('api/settings/site');

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final SiteSettingsResponse responseModel =
          SiteSettingsResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<VendorRecietOfferListResponse?> getReceiveOfferList(
      int page) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();
      final Map<String, String> queries = {'page': '$page'};

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      final Response response = await apiHttpClient.get(
          'api/product/make-an-offer/user-list',
          query: queries,
          headers: APIHelper.getAuthHeaderMap());

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final VendorRecietOfferListResponse responseModel =
          VendorRecietOfferListResponse.getAPIResponseObjectSafeValue(
              response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<ChatRecipients?> getChatList({String vendorID = ''}) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      Map<String, String>? queries;
      if (vendorID.isNotEmpty) {
        queries = {'vendor': vendorID};
      }
      final Response response = await apiHttpClient.get(
        'api/user/chat-list',
        query: queries,
        headers: APIHelper.getAuthHeaderMap(),
      );

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final ChatRecipients responseModel =
          ChatRecipients.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<RawAPIResponse?> logout(String requestJsonString) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      // final Map<String, String> queries = {'page': '$pageNumber'};
      final Response response = await apiHttpClient.post('api/user/logout',
          body: requestJsonString, headers: APIHelper.getAuthHeaderMap());

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final RawAPIResponse responseModel =
          RawAPIResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<RawAPIResponse?> uploadChatImage(String requestBodyJson) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      final Response response = await apiHttpClient.post(
        'api/user/message/attach-file-send',
        headers: APIHelper.getAuthHeaderMap(),
        body: requestBodyJson,
      );

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final RawAPIResponse objectResponse =
          RawAPIResponse.getAPIResponseObjectSafeValue(response.body);
      return objectResponse;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<RawAPIResponse?> moveToTrash(String requestJsonString) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      final Response response = await apiHttpClient.post('api/product/trash',
          body: requestJsonString, headers: APIHelper.getAuthHeaderMap());

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final RawAPIResponse responseModel =
          RawAPIResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<RawAPIResponse?> recoverTrash(String requestJsonString) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      final Response response = await apiHttpClient.post('api/product/trash',
          body: requestJsonString, headers: APIHelper.getAuthHeaderMap());

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final RawAPIResponse responseModel =
          RawAPIResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<RawAPIResponse?> permanentDeleteProduct(
      Map<String, String> query) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      final Response response = await apiHttpClient.delete('api/product',
          query: query, headers: APIHelper.getAuthHeaderMap());

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final RawAPIResponse responseModel =
          RawAPIResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<CouponListsResponse?> getCoupons(int page) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();
      final Map<String, String> queries = {'page': '$page'};

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      final Response response = await apiHttpClient.get(
          'api/coupon/vendor-list',
          query: queries,
          headers: APIHelper.getAuthHeaderMap());

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final CouponListsResponse responseModel =
          CouponListsResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<RawAPIResponse?> submitCoupon(
      Map<String, dynamic> requestMap) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final requestJson = jsonEncode(requestMap);
      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      final Response response = await apiHttpClient.post('api/coupon',
          body: requestJson, headers: APIHelper.getAuthHeaderMap());

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final RawAPIResponse responseModel =
          RawAPIResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<RawAPIResponse?> deleteCoupon(
      Map<String, String> queries) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      final Response response = await apiHttpClient.delete('api/coupon',
          query: queries, headers: APIHelper.getAuthHeaderMap());

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final RawAPIResponse responseModel =
          RawAPIResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<RawAPIResponse?> setStoreLocation(
      Map<String, dynamic> requestMap) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final requestJson = jsonEncode(requestMap);
      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      final Response response = await apiHttpClient.post(
          'api/store/update/common-fields',
          body: requestJson,
          headers: APIHelper.getAuthHeaderMap());

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final RawAPIResponse responseModel =
          RawAPIResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }

  static Future<PickupStationsResponse?> getPickupStations(
      {int page = 1}) async {
    try {
      // Before calling API method, checks for any issues, errors and throw if
      // found
      await APIHelper.preAPICallCheck();

      final GetHttpClient apiHttpClient = APIClient.instance.getAPIClient();
      final Response response = await apiHttpClient.get(
          'api/pickup-station/short-info',
          query: {'page': page.toString()},
          headers: APIHelper.getAuthHeaderMap());

      // After post API call checking, any issues, errors found throw exception
      APIHelper.postAPICallCheck(response);
      final PickupStationsResponse responseModel =
          PickupStationsResponse.getAPIResponseObjectSafeValue(response.body);
      if (APIHelper.isResponseStatusCodeIn400(response.statusCode)) {
        responseModel.error = true;
      }
      return responseModel;
    } catch (exception) {
      APIHelper.handleExceptions(exception);
      return null;
    }
  }
}
