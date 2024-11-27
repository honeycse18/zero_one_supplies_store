import 'package:ecomikstoreapp/utils/helpers/api_helper.dart';

class SignUpResponse {
  bool error;
  String msg;
  String token;
  String otp;
  String phone;
  String email;

  SignUpResponse(
      {this.error = false,
      this.msg = '',
      this.token = '',
      this.otp = '',
      this.phone = '',
      this.email = ''});

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
      error: APIHelper.getSafeBoolValue(json['error']),
      msg: APIHelper.getSafeStringValue(json['msg']),
      token: APIHelper.getSafeStringValue(json['token']),
      otp: APIHelper.getSafeStringValue(json['otp']),
      phone: APIHelper.getSafeStringValue(json['phone']),
      email: APIHelper.getSafeStringValue(json['email']),
    );
  }

  Map<String, dynamic> toJson() => {
        'error': error,
        'msg': msg,
        'token': token,
        'otp': otp,
        'phone': phone,
        'email': email,
      };

  static SignUpResponse getAPIResponseObjectSafeValue(
          dynamic unsafeResponseValue) =>
      APIHelper.isAPIResponseObjectSafe(unsafeResponseValue)
          ? SignUpResponse.fromJson(unsafeResponseValue as Map<String, dynamic>)
          : SignUpResponse();
}
