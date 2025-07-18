import 'package:demo_app/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:demo_app/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:demo_app/presentation/cubits/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:demo_app/presentation/cubits/splash_cubit/splash_cubit.dart';
import 'package:demo_app/presentation/screens/dashboard.dart';
import 'package:demo_app/presentation/screens/auth_screen.dart';
import 'package:demo_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/blocs/dashboard_bloc/dashboard_bloc.dart';
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
          builder: (_) => BlocProvider<AuthBloc>(
            create: (context) => AuthBloc()..add(AuthEvent.started()),
            child: AuthScreen(),
          ),
        );
      case Routes.dashboardScreen:
        return MaterialPageRoute(
            builder: (create)=> MultiBlocProvider(
              providers: [
                BlocProvider<DashboardBloc>(
                  create: (context) => DashboardBloc(),
                ),
                BlocProvider<HomeBloc>(
                  create: (context) => HomeBloc()..add(HomeEvent.started()),
                ),
              ],
                child: const Dashboard(),
            ));
      default:
    return MaterialPageRoute(
    builder: (create)=> const Dashboard());
    }
  }
}
