import 'package:flutter/material.dart';
import 'package:quent/app/qent_app.dart';
import 'package:quent/core/services/local/preference_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceManager().init();
  runApp(const QentApp());
}
