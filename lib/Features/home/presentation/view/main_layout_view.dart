import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/home/presentation/components/layout/custom_bottom_navigation_bar.dart';
import 'package:quent/Features/home/presentation/cubits/layout/layout_cubit.dart';
import 'package:quent/core/resources/app_margin.dart';

class MainLayoutView extends StatelessWidget {
  const MainLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    final layoutCubit = context.watch<LayoutCubit>();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: IndexedStack(
                index: layoutCubit.currentIndex,
                children: layoutCubit.screens,
              ),
            ),
            Positioned(
              left: AppMargin.m16,
              right: AppMargin.m16,
              bottom: AppMargin.m16,
              child: CustomBottomNavigationBar(),
            ),
          ],
        ),
      ),
    );
  }
}
