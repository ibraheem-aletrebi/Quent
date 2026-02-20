import 'dart:developer';
import 'dart:io';
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
    if (e is! Exception) {
      return ApiErrorFactory.defaultError;
    }
    if (e is DioException) {
      log('DioException: ${e.message}');
      log('Response: ${e.response}');

      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          return _buildError(
            message: 'Connection timed out.',
            action: 'Please check your internet connection and try again.',
            icon: Icons.wifi_off,
            code: ApiLocalStatusCode.connectionTimeout,
          );

        case DioExceptionType.sendTimeout:
          return _buildError(
            message: 'Request took too long to send.',
            action:
                'Please retry. If the problem persists, check your connection.',
            icon: Icons.file_upload_off,
            code: ApiLocalStatusCode.sendTimeout,
          );

        case DioExceptionType.receiveTimeout:
          return _buildError(
            message: 'Server is taking too long to respond.',
            action: 'Please try again in a few moments.',
            icon: Icons.hourglass_bottom,
            code: ApiLocalStatusCode.receiveTimeout,
          );

        case DioExceptionType.badCertificate:
          return _buildError(
            message: 'Secure connection failed.',
            action: 'Please update the app or contact support.',
            icon: Icons.security,
            code: ApiLocalStatusCode.forbidden,
          );

        case DioExceptionType.badResponse:
          return _handleBadResponse(e);

        case DioExceptionType.cancel:
          return _buildError(
            message: 'Request was cancelled.',
            action: 'Please try again if this was unexpected.',
            icon: Icons.cancel,
            code: ApiLocalStatusCode.cancel,
          );

        case DioExceptionType.connectionError:
          return _buildError(
            message: 'No internet connection.',
            action: 'Turn on WiFi or mobile data and try again.',
            icon: Icons.wifi_off,
            code: ApiLocalStatusCode.connectionError,
          );

        case DioExceptionType.unknown:
          if (e.error is SocketException) {
            return _buildError(
              message: 'No internet connection.',
              action: 'Check your network and try again.',
              icon: Icons.wifi_off,
              code: ApiLocalStatusCode.connectionError,
            );
          }

          return _buildError(
            message: 'Unexpected error occurred.',
            action: 'Please try again later.',
            icon: Icons.error_outline,
            code: ApiLocalStatusCode.unknown,
          );
      }
    }

    return ApiErrorFactory.defaultError;
  }

  ApiErrorModel _handleBadResponse(DioException e) {
    final statusCode = e.response?.statusCode ?? 0;
    final data = e.response?.data;

    switch (statusCode) {
      case 400:
        final message = _extractValidationMessage(data) ?? 'Invalid request.';
        return _buildError(
          message: message,
          action: 'Please check your input and try again.',
          icon: Icons.warning_amber_rounded,
          code: ApiLocalStatusCode.badRequest,
        );

      case 401:
        return _buildError(
          message: 'Session expired.',
          action: 'Please login again.',
          icon: Icons.lock_outline,
          code: ApiLocalStatusCode.unauthorized,
        );

      case 403:
        return _buildError(
          message: 'Access denied.',
          action: 'You do not have permission to perform this action.',
          icon: Icons.block,
          code: ApiLocalStatusCode.forbidden,
        );

      case 404:
        return _buildError(
          message: 'Resource not found.',
          action: 'The requested data could not be found.',
          icon: Icons.search_off,
          code: ApiLocalStatusCode.notFound,
        );

      case 422:
        final message = _extractValidationMessage(data) ?? 'Validation failed.';
        return _buildError(
          message: message,
          action: 'Please review your input and try again.',
          icon: Icons.rule,
          code: ApiLocalStatusCode.badRequest,
        );

      case 500:
        return _buildError(
          message: 'Server error.',
          action: 'Please try again later.',
          icon: Icons.cloud_off,
          code: ApiLocalStatusCode.internalServerError,
        );

      default:
        return _buildError(
          message: 'Unexpected server error.',
          action: 'Please try again later.',
          icon: Icons.error_outline,
          code: ApiLocalStatusCode.defaultError,
        );
    }
  }

  String? _extractValidationMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      final errors = data['error'];
      if (errors is Map<String, dynamic>) {
        for (final value in errors.values) {
          if (value is List && value.isNotEmpty) {
            return value.first.toString();
          }
        }
      }
    }
    return null;
  }

  ApiErrorModel _buildError({
    required String message,
    required String action,
    required IconData icon,
    required ApiLocalStatusCode code,
  }) {
    return ApiErrorModel(
      message: message,
      action: action,
      icon: icon,
      statusCode: code,
    );
  }
}
