import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../core.dart';
import '../../router/navigator_keys.dart';
import '../error/error_422_model.dart';
import '../error/failures.dart';
import 'connection_ckecker.dart';

abstract class ApiClientHelper {
  static Future<Either<KFailure, dynamic>> responseOrFailure({Future<Response<dynamic>>? func, Response<dynamic>? res}) async {
    try {
      if (!(await ConnectivityCheck.call())) {
        return left(const KFailure.offline());
      } else {
        final response = (res ?? await func);
        return statusCodeChecker(response);
      }
    } on DioException catch (e) {

      debugPrint('======DioException=========== $e : ');
      debugPrint('======DioException=========== ${e.message} : ');
      debugPrint('======DioException=========== ${e.error} : ');
      debugPrint('======DioException=========== ${e.response} : ');
      return left(dioExToFailureMap(e));
    } catch (e) {
      debugPrint('========Response Or Failure (catch) =========${e.toString()}');
      return left(const KFailure.someThingWrongPleaseTryAgain());
    }
  }

  static Either<KFailure, dynamic> statusCodeChecker(Response<dynamic>? response) {
    // shoToastMsg(response);
    if (response?.statusCode == 200) {
      return right(response?.data);
    }
    if (response?.data["errorMessage"].toString() == "Access Denied") {
      Modular.get<PreferenceManager>().logout();
      // Modular.to.navigate(NavigatorKeys.AUTH_KEY);
      return right(response?.data);
    }

    else {

      final fail = statusCodeToFailureMap(response) ?? const KFailure.someThingWrongPleaseTryAgain();
      return left(fail);
    }
  }

  static KFailure? statusCodeToFailureMap(Response<dynamic>? response) {
    final method = response?.requestOptions.method;
    final map = {
      400: response?.data is Map<String, dynamic> ? KFailure.error422(Error422Model.fromJson(response?.data)) : KFailure.error(response?.statusMessage ?? ""),
      401: const KFailure.error401(),
      403: const KFailure.error403(),
      404: const KFailure.error404(),
      405: KFailure.error("Method Not Allowed , you are using ($method) method "),
      409: const KFailure.error409(),
      500: response?.data is Map<String, dynamic> ? KFailure.error422(Error422Model.fromJson(response?.data)) : KFailure.error(response?.statusMessage ?? ""),
      422: response?.data is Map<String, dynamic> ? KFailure.error422(Error422Model.fromJson(response?.data)) : KFailure.error(response?.statusMessage ?? ""),
    };

    return map[response?.statusCode];
  }

  static KFailure dioExToFailureMap(DioException e) {
    final map = {
      DioExceptionType.connectionTimeout: const KFailure.connectionTimeout(),
      DioExceptionType.connectionError: const KFailure.connectionError(),
      DioExceptionType.receiveTimeout: const KFailure.receiveTimeout(),
      DioExceptionType.sendTimeout: const KFailure.sendTimeout(),
      DioExceptionType.badResponse: statusCodeChecker(e.response).fold((l) => l, (r) => null),
      DioExceptionType.unknown: e.error is SocketException ? const KFailure.offline() : const KFailure.offline(),
    };
    return map[e.type] ?? const KFailure.someThingWrongPleaseTryAgain();
  }
}
