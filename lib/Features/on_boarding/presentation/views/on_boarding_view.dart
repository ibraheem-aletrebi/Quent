import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/on_boarding/data/models/on_boarding_model.dart';
import 'package:quent/Features/on_boarding/presentation/components/on_boarding_bloc_builder.dart';
import 'package:quent/Features/on_boarding/presentation/cubits/on_boarding_cubits/on_boarding_cubit.dart';
import 'package:quent/core/resources/app_assets.dart';
import 'package:quent/generated/l10n.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  List<OnBoardingModel> getOnboardingPages(BuildContext context) => [
    OnBoardingModel(
      image: AppAssets.onBoardingOne,
      title: S.of(context).onboarding_one_title,
      body: S.of(context).onboarding_one_body,
    ),
    OnBoardingModel(
      image: AppAssets.onBoardingTwo,
      title: S.of(context).onboarding_two_title,
      body: S.of(context).onboarding_two_body,
    ),
    OnBoardingModel(
      image: AppAssets.onBoardingThree,
      title: S.of(context).onboarding_three_title,
      body: S.of(context).onboarding_three_body,
    ),
    OnBoardingModel(
      image: AppAssets.onBoardingFour,
      title: S.of(context).onboarding_four_title,
      body: S.of(context).onboarding_four_body,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnBoardingCubit>(
      create: (context) => OnBoardingCubit(),
      child: Builder(
        builder: (context) {
          context.read<OnBoardingCubit>().pages = getOnboardingPages(context);
          context.read<OnBoardingCubit>().precacheImages(context);
          return Scaffold(body: SafeArea(child: OnBoardingBlocBuilder()));
        },
      ),
    );
  }
}
