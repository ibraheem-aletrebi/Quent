import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quent/core/cubits/theme_cubit/theme_cubit.dart';
import 'package:quent/core/resources/app_assets.dart';
import 'package:quent/core/resources/app_size.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      context.watch<ThemeCubit>().isDarkMode
          ? AppAssets.darkLogoSvg
          : AppAssets.lightLogoSvg,
      width: AppSize.s80,
    );
  }
}
