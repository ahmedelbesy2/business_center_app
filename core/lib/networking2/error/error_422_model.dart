// To parse this JSON data, do
//
//     final error422Model = error422ModelFromJson(jsonString);

import 'dart:convert';

Error422Model error422ModelFromJson(String str) => Error422Model.fromJson(json.decode(str));

String error422ModelToJson(Error422Model data) => json.encode(data.toJson());

class Error422Model {
  final int? errorCode;
  final String? errorMessage;
  final String? errorType;

  Error422Model({
    this.errorCode,
    this.errorMessage,
    this.errorType,
  });

  Error422Model copyWith({
    int? errorCode,
    String? errorMessage,
    String? errorType,
  }) =>
      Error422Model(
        errorCode: errorCode ?? this.errorCode,
        errorMessage: errorMessage ?? this.errorMessage,
        errorType: errorType ?? this.errorType,
      );

  factory Error422Model.fromJson(Map<String, dynamic> json) => Error422Model(
    errorCode: json["errorCode"],
    errorMessage: json["errorMessage"],
    errorType: json["errorType"],
  );

  Map<String, dynamic> toJson() => {
    "errorCode": errorCode,
    "errorMessage": errorMessage,
    "errorType": errorType,
  };
}
