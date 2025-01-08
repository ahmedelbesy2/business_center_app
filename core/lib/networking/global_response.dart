// To parse this JSON data, do
//
//     final globalResponse = globalResponseFromJson(jsonString);

import 'dart:convert';

GlobalResponse globalResponseFromJson(String str) => GlobalResponse.fromJson(json.decode(str));

String globalResponseToJson(GlobalResponse data) => json.encode(data.toJson());

class GlobalResponse {
  final bool? success;
  final String? message;
   var data;
  final dynamic pagination;
  final int? statusCode;
  final dynamic error;

  GlobalResponse({
    this.success,
    this.message,
    this.data,
    this.pagination,
    this.statusCode,
    this.error,
  });

  GlobalResponse copyWith({
    bool? success,
    String? message,
  var data,
    dynamic pagination,
    int? statusCode,
    dynamic error,
  }) =>
      GlobalResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
        pagination: pagination ?? this.pagination,
        statusCode: statusCode ?? this.statusCode,
        error: error ?? this.error,
      );

  factory GlobalResponse.fromJson(Map<String, dynamic> json) => GlobalResponse(
    success: json["success"],
    message: json["message"],
    data: json["data"],
    pagination: json["pagination"],
    statusCode: json["statusCode"],
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data,
    "pagination": pagination,
    "statusCode": statusCode,
    "error": error,
  };
}
