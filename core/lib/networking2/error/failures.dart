import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'error_422_model.dart';

part 'failures.freezed.dart';

@freezed
class KFailure with _$KFailure {
  const factory KFailure.server() = KFailureServer;

  const factory KFailure.offline({RequestOptions? option}) = KFailureOffline;

  const factory KFailure.locationDenied() = KFailureLocationDenied;

  const factory KFailure.locationDisabled() = KFailureLocationDisabled;

  const factory KFailure.locationDeniedPermanently() = KFailureLocationDeniedPermanently;

  const factory KFailure.someThingWrongPleaseTryAgain() = KFailureSomeThingWrongPleaseTryAgain;

  const factory KFailure.error(String error) = KFailureDecodingResponse;

  const factory KFailure.error422(Error422Model error) = KFailureError422;

  const factory KFailure.error401() = KFailureError401;

  const factory KFailure.error403() = KFailureError403;

  const factory KFailure.error409() = KFailureError409;

  const factory KFailure.error404() = KFailureError404;

  const factory KFailure.connectionTimeout() = KFailureErrorConnectionTimeout;

  const factory KFailure.connectionError() = KFailureErrorConnectionError;

  const factory KFailure.receiveTimeout() = KFailureErrorReceiveTimeout;

  const factory KFailure.badResponse() = KFailureErrorBadResponse;

  const factory KFailure.sendTimeout() = KFailureErrorSendTimeout;

  const factory KFailure.googleAuthFailure() = KFailureGoogleAuth;

  const factory KFailure.facebookAuthFailure() = KFailureFacebookAuthFailed;

  const factory KFailure.facebookAuthCancelled() = KFailureFacebookAuthCancelled;

  static String toError(KFailure failure) {
    return failure.when(
      server: () => 'Tr.get.try_later',
      offline: (option) => 'no_connection'.tr(),
      locationDenied: () => 'Tr.get.location_denaid',
      locationDisabled: () => 'Tr.get.location_disabled',
      locationDeniedPermanently: () => 'Tr.get.location_denaid_permanently',
      someThingWrongPleaseTryAgain: () => 'Tr.get.try_later',
      error: (error) => error,

      error422: (error) {
        return error.errorMessage.toString();
        // if (error.errors.length > 1) {
        //   return error.errors.fold(
        //     '',
        //     (previousValue, element) => "$previousValue\n ${element.toString().replaceAll('.', '')}",
        //   );
        // } else {
        //   return error.errors?.firstOrNull;
        // }
      },

      error401: () => 'Tr.get.unauthorized',
      error403: () => 'Tr.get.forbidden',
      error404: () => 'Tr.get.not_found',
      error409: () => 'Tr.get.not_verified',
      badResponse: () => 'Tr.get.something_went_wrong',
      connectionError: () => 'Tr.get.request_time_out',
      receiveTimeout: () => 'Tr.get.receive_time_out',
      connectionTimeout: () => 'Tr.get.connection_time_out',
      sendTimeout: () => 'Tr.get.send_time_out',
      googleAuthFailure: () => 'Sign in with Google failed',
      facebookAuthFailure: () => 'Sign in with Facebook failed',
      facebookAuthCancelled: () => 'Sign in with Facebook cancelled',
    );
  }
}

// flutter pub run build_runner watch --delete-conflicting-outputs
