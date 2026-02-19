import 'package:flutter/material.dart';
import 'package:quent/core/services/network/api_local_status_code.dart';

class ApiErrorModel {
  final String message;
  final String? action;
  final IconData? icon;
  final ApiLocalStatusCode? statusCode;

  const ApiErrorModel({
    required this.message,
    this.action,
     this.icon,
     this.statusCode,
  });
}
