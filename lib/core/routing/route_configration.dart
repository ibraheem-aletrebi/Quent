import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/presentation/views/forgot_password_view.dart';
import 'package:quent/Features/auth/presentation/views/login_view.dart';
import 'package:quent/Features/auth/presentation/views/phone_verification_view.dart';
import 'package:quent/Features/auth/presentation/views/signup_view.dart';
import 'package:quent/Features/home/presentation/cubits/layout/layout_cubit.dart';
import 'package:quent/Features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:quent/core/constants/storage_keys.dart';
import 'package:quent/core/routing/app_route.dart';
import 'package:quent/core/services/local/preference_manager.dart';
import 'package:quent/Features/home/presentation/view/main_layout_view.dart';

class RouteConfigration {
  RouteConfigration._();
  static final RouteConfigration instance = RouteConfigration._();
  factory RouteConfigration() => instance;

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case AppRoutes.signUp:
        return MaterialPageRoute(builder: (_) => const SignupView());
      case AppRoutes.forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case AppRoutes.phoneVerification:
        return MaterialPageRoute(builder: (_) => const PhoneVerificationView());

      case AppRoutes.main:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LayoutCubit>(
            create: (context) => LayoutCubit(),
            child: const MainLayoutView(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }

  String getInitialRoute() {
    bool isShownOnboarding =
        PreferenceManager().getBool(StorageKeys.isShownOnboarding) ?? false;
    return isShownOnboarding ? AppRoutes.main : AppRoutes.onboarding;
  }
}
