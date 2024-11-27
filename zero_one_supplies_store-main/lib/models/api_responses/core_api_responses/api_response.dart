import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';

class APIResponse<D> {
  bool error;
  String msg;
  D data;

  APIResponse({this.error = false, this.msg = '', required this.data});

  factory APIResponse.fromJson(Map<String, dynamic> json,
      {required D Function(dynamic) dataFromJson}) {
    return APIResponse(
      error: APIHelper.getSafeBoolValue(json['error']),
      msg: APIHelper.getSafeStringValue(json['msg']),
      data: dataFromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(D) dataToJson) => {
        'error': error,
        'msg': msg,
        'data': dataToJson(data),
      };

  factory APIResponse.empty(D emptyData) => APIResponse(data: emptyData);

  static APIResponse getAPIResponseObjectSafeValue<D>(
          dynamic unsafeResponseValue,
          {required D Function(dynamic) dataFromJson,
          required D emptyData}) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? APIResponse.fromJson(unsafeResponseValue as Map<String, dynamic>,
              dataFromJson: dataFromJson)
          : APIResponse.empty(emptyData);
}
