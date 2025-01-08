import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiClientBloc extends Cubit<ApiClientState> {
  ApiClientBloc() : super(const ApiClientState.initial());

  static ApiClientBloc of(BuildContext context) => BlocProvider.of<ApiClientBloc>(context);

  Future<void> onErrorCallBack(DioException error) async {
    emit(const ApiClientState.initial());
    final failure = ApiClientHelper.dioExToFailureMap(error);
    emit(ApiClientState.error(failure: failure));
  }

  onResponseCallBack(Response<dynamic> response) async {
    emit(const ApiClientState.initial());
    final failure = ApiClientHelper.statusCodeToFailureMap(response);
    if (failure == null) return;
    emit(ApiClientState.error(failure: failure));
  }

  onRequestCallBack(RequestOptions request) {
    String token = PreferenceManager().authToken();
    String language = PreferenceManager().currentLang();
    if (token != '' || token == null) {
      request.headers.addAll({'Authorization': token});
    }
    request.headers.addAll({"Accept-Language": (language == 'ar' ? '$language-EG' : '$language-US')});
  }

  Future<Response> scheduleRetry(RequestOptions options) {
    final responseCompleter = Completer<Response>();
    late StreamSubscription subscription;
    debugPrint('================= Schedule Retry For: ${options.path} ');
    emit(ApiClientState.error(failure: KFailure.offline(option: options)));

    subscription = ConnectivityCheck.connectionStream.listen((event) {
      if (event != ConnectivityResult.none) {
        debugPrint('scheduleRetry listening');
        responseCompleter.complete(
          Modular.get<DioClientImpl>().request(
            options.path,
            cancelToken: options.cancelToken,
            data: options.data,
            onReceiveProgress: options.onReceiveProgress,
            onSendProgress: options.onSendProgress,
            params: options.queryParameters,
          ),
        );
        subscription.cancel();
      }
    });
    return responseCompleter.future;
  }
}
