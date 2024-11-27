import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';

class APIListResponse<D> {
  bool error;
  String msg;
  List<D> data;

  APIListResponse({this.error = false, this.msg = '', this.data = const []});

  factory APIListResponse.fromJson(Map<String, dynamic> json,
      {required D Function(dynamic) dataFromJson}) {
    return APIListResponse(
      error: APIHelper.getSafeBoolValue(json['error']),
      msg: APIHelper.getSafeStringValue(json['msg']),
      data: APIHelper.getSafeListValue(json['docs'])
          .map<D>((e) => dataFromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(D) dataToJson) => {
        'error': error,
        'msg': msg,
        'data': data.map((e) => dataToJson(e)).toList(),
      };

  static APIListResponse getAPIResponseObjectSafeValue<D>(
          dynamic unsafeResponseValue,
          {required D Function(dynamic) dataFromJson,
          required D emptyData}) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? APIListResponse.fromJson(
              unsafeResponseValue as Map<String, dynamic>,
              dataFromJson: dataFromJson)
          : APIListResponse();
}
