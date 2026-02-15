import 'package:flutter/material.dart';
import 'package:quent/app/qent_app.dart';
import 'package:quent/core/di/services_locator.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpServicesLocator();
  runApp(const QentApp());
}


