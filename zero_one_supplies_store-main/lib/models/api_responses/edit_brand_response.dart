import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';

class EditBrandResponse {
  bool error;
  String msg;

  EditBrandResponse({this.error = false, this.msg = ''});

  factory EditBrandResponse.fromJson(Map<String, dynamic> json) {
    return EditBrandResponse(
      error: APIHelper.getSafeBoolValue(json['error']),
      msg: APIHelper.getSafeStringValue(json['msg']),
    );
  }

  Map<String, dynamic> toJson() => {
        'error': error,
        'msg': msg,
      };
  static EditBrandResponse getAPIResponseObjectSafeValue(
          Object? unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? EditBrandResponse.fromJson(
              unsafeResponseValue as Map<String, dynamic>)
          : EditBrandResponse();
}
