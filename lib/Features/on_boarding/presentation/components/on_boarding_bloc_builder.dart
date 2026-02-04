import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/on_boarding/presentation/components/get_started_button.dart';
import 'package:quent/Features/on_boarding/presentation/components/indicator.dart';
import 'package:quent/Features/on_boarding/presentation/components/next_button.dart';
import 'package:quent/Features/on_boarding/presentation/components/on_boarding_page.dart';
import 'package:quent/Features/on_boarding/presentation/cubits/on_boarding_cubits/on_boarding_cubit.dart';
import 'package:quent/Features/on_boarding/presentation/cubits/on_boarding_cubits/on_boarding_states.dart';
import 'package:quent/core/widgets/theme_language_switcher.dart';

class OnBoardingBlocBuilder extends StatelessWidget {
  const OnBoardingBlocBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        final onBoardingController = context.watch<OnBoardingCubit>();
        return Stack(
          fit: StackFit.expand,
          children: [
            PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: onBoardingController.controller,
              itemCount: onBoardingController.pages!.length,
              onPageChanged: (index) =>
                  onBoardingController.onPageChanged(index, context),
              itemBuilder: (_, index) => OnBoardingPage(
                onBoardingPageModel: onBoardingController.pages![index],
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              left: 16,
              child: ThemeLanguageSwitcher(),
            ),
            Positioned(
              left: 24,
              right: 24,
              bottom: 30,
              child: onBoardingController.isLastPage()
                  ? GetStartedButton()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Indicator(), NextButton()],
                    ),
            ),
          ],
        );
      },
    );
  }
}
