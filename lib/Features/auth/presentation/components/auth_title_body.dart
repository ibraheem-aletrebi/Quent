import 'package:flutter/material.dart';
import 'package:quent/core/resources/app_size.dart';

class AuthTitleBody extends StatelessWidget {
  const AuthTitleBody({super.key, required this.title, required this.body});
  final String title;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextTheme.of(context).titleMedium,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppSize.s16),
        Text(
          body,
          style: TextTheme.of(context).displaySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
