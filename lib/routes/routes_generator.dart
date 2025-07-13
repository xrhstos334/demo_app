import 'package:demo_app/core/di/locator.dart';
import 'package:demo_app/core/services/repository_service.dart';
import 'package:demo_app/presentation/blocs/login_bloc.dart';
import 'package:demo_app/presentation/cubits/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:demo_app/presentation/cubits/splash_cubit/splash_cubit.dart';
import 'package:demo_app/presentation/screens/login_screen.dart';
import 'package:demo_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/screens/on_boarding_screen.dart';
import '../presentation/screens/splash_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class RouteGenerator {
  static String? currentRouteName;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    currentRouteName = settings.name;
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SplashCubit>(
            create: (context) => SplashCubit(
              onBoardingRepository:
                  getIt<RepositoryService>().onBoardingRepository,
            ),
            child: const SplashScreen(),
          ),
        );
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<OnBoardingCubit>(
                create: (context) => OnBoardingCubit(
                      args: settings.arguments as Map<String, dynamic>,
                    ),
                child: const OnBoardingScreen()));
      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<LoginBloc>(
                create: (context) => LoginBloc(), child: const LoginScreen()));

      default:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SplashCubit>(
            create: (context) => SplashCubit(
              onBoardingRepository:
                  getIt<RepositoryService>().onBoardingRepository,
            ),
            child: const SplashScreen(),
          ),
        );
    }
  }
}
