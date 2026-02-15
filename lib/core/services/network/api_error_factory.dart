
import 'package:flutter/material.dart';
import 'package:quent/core/services/network/api_error_model.dart';
import 'package:quent/core/services/network/api_local_status_code.dart';

class ApiErrorFactory {
  static ApiErrorModel get defaultError => ApiErrorModel(
        message: "Something went wrong",
        icon: Icons.error,
        statusCode: ApiLocalStatusCode.defaultError,
      );
}