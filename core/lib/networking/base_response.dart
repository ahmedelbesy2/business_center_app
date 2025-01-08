import 'package:core/core.dart';

class BaseResponse extends BaseMappable {
  bool? isSuccess;
  int? httpCode;
  String? successMessage;

  BaseResponse({this.isSuccess , this.httpCode , this.successMessage});

  @override
  Mappable fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    httpCode = json['httpCode'];
    successMessage = json['successMessage'];
    return BaseResponse(isSuccess:isSuccess , httpCode :httpCode , successMessage: successMessage);
  }
}
