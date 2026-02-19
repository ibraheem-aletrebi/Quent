import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quent/core/services/network/api_error_factory.dart';
import 'package:quent/core/services/network/api_error_model.dart';
import 'package:quent/core/services/network/api_local_status_code.dart';

class ApiErrorHandler {
  ApiErrorHandler._();
  static final ApiErrorHandler instance = ApiErrorHandler._();
  factory ApiErrorHandler() => instance;

  ApiErrorModel handle(dynamic e) {
    if (e is Exception) {
      if (e is DioException) {
        switch (e.type) {
          case DioExceptionType.connectionTimeout:
            return ApiErrorModel(
              message: 'Connection timed out.',
              action: 'Please check your internet connection and try again.',
              icon: Icons.wifi_off,
              statusCode: ApiLocalStatusCode.connectionTimeout,
            );

          case DioExceptionType.sendTimeout:
            return ApiErrorModel(
              message: 'Request took too long to send.',
              action:
                  'Please retry. If the problem persists, check your connection.',
              icon: Icons.file_upload_off,
              statusCode: ApiLocalStatusCode.sendTimeout,
            );

          case DioExceptionType.receiveTimeout:
            return ApiErrorModel(
              message: 'Server is taking too long to respond.',
              action: 'Please try again in a few moments.',
              icon: Icons.hourglass_bottom,
              statusCode: ApiLocalStatusCode.receiveTimeout,
            );

          case DioExceptionType.badCertificate:
            return ApiErrorModel(
              message: 'Secure connection failed.',
              action: 'Please update the app or contact support.',
              icon: Icons.security,
              statusCode: ApiLocalStatusCode.forbidden,
            );

          case DioExceptionType.badResponse:
            return _handleBadResponse(e);

          case DioExceptionType.cancel:
            return ApiErrorModel(
              message: 'Request was cancelled.',
              action: 'Please try again if this was unexpected.',
              icon: Icons.cancel,
              statusCode: ApiLocalStatusCode.cancel,
            );

          case DioExceptionType.connectionError:
            return ApiErrorModel(
              message: 'No internet connection.',
              action: 'Turn on WiFi or mobile data and try again.',
              icon: Icons.wifi_off,
              statusCode: ApiLocalStatusCode.connectionError,
            );

          case DioExceptionType.unknown:
            return ApiErrorModel(
              message: 'Unexpected error occurred.',
              action: 'Please try again later.',
              icon: Icons.error_outline,
              statusCode: ApiLocalStatusCode.unknown,
            );
        }
      } else {
        return ApiErrorFactory.defaultError;
      }
    }
    return ApiErrorFactory.defaultError;
  }

  ApiErrorModel _handleBadResponse(DioException e) {
    final statusCode = e.response?.statusCode ?? 0;
    final data = e.response?.data;

    switch (statusCode) {
      case 400:
        if (data != null && data['error'] != null) {
          return ApiErrorModel(
            message: data['error']['email'][0],
            action: 'Please check your input and try again.',
            icon: Icons.warning_amber_rounded,
            statusCode: ApiLocalStatusCode.badRequest,
          );
        }

        return ApiErrorModel(
          message: 'Invalid request.',
          action: 'Please check your input and try again.',
          icon: Icons.warning_amber_rounded,
          statusCode: ApiLocalStatusCode.badRequest,
        );

      case 401:
        return ApiErrorModel(
          message: 'Unauthorized access.',
          action: 'Please login again.',
          icon: Icons.lock_outline,
          statusCode: ApiLocalStatusCode.unauthorized,
        );

      case 403:
        return ApiErrorModel(
          message: 'Access denied.',
          action: 'You do not have permission to perform this action.',
          icon: Icons.block,
          statusCode: ApiLocalStatusCode.forbidden,
        );

      case 404:
        return ApiErrorModel(
          message: 'Resource not found.',
          action: 'The requested data could not be found.',
          icon: Icons.search_off,
          statusCode: ApiLocalStatusCode.notFound,
        );

      case 500:
        return ApiErrorModel(
          message: 'Server error.',
          action: 'Please try again later.',
          icon: Icons.cloud_off,
          statusCode: ApiLocalStatusCode.internalServerError,
        );

      default:
        return ApiErrorModel(
          message: 'Unexpected server error.',
          action: 'Please try again later.',
          icon: Icons.error_outline,
          statusCode: ApiLocalStatusCode.defaultError,
        );
    }
  }
}
