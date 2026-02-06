import 'package:flutter/material.dart';
import 'package:quent/Features/on_boarding/data/models/on_boarding_model.dart';


class OnBoardingPageContent extends StatelessWidget {
  const OnBoardingPageContent({super.key, required this.onBoardingPageModel});

  final OnBoardingModel onBoardingPageModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          onBoardingPageModel.title,
          style: TextTheme.of(context).displayLarge?.copyWith(height: 1.2),
        ),
        const SizedBox(height: 12),
        Text(
          onBoardingPageModel.body,
          style: TextTheme.of(context).displaySmall?.copyWith(height: 1.6),
        ),
      ],
    );
  }
}
