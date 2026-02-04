import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/on_boarding/presentation/cubits/on_boarding_cubits/on_boarding_cubit.dart';
import 'package:quent/core/animation/animated_circular_progress_indicator.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<OnBoardingCubit>();
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 60,
          width: 60,
          child: AnimatedCircularProgressIndicator(
            value: controller.getProgressValue(),
            backgroundColor: Colors.transparent,
          ),
        ),
        IconButton(
          style: IconButton.styleFrom(fixedSize: Size(48, 48)),
          onPressed: () => controller.goToNextPage(),
          icon: Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }
}
