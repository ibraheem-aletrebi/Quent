import 'package:flutter/material.dart';
import 'package:quent/Features/on_boarding/data/models/on_boarding_model.dart';
import 'package:quent/Features/on_boarding/presentation/components/linear_gradient_container.dart';
import 'package:quent/Features/on_boarding/presentation/components/on_boarding_page_content.dart';

class OnBoardingPage extends StatelessWidget {
  final OnBoardingModel onBoardingPageModel;

  const OnBoardingPage({super.key, required this.onBoardingPageModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          onBoardingPageModel.image,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        LinearGradientContainer(),
        Positioned(
          left: 24,
          right: 24,
          bottom: 150,
          child: OnBoardingPageContent(
            onBoardingPageModel: onBoardingPageModel,
          ),
        ),
      ],
    );
  }
}
