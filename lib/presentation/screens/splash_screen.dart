import 'dart:io';

import 'package:demo_app/core/utils/keys/asset_keys.dart';
import 'package:demo_app/presentation/cubits/splash_cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/style.dart';
import '../../core/utils/logger.dart';
import '../../core/utils/size_config.dart';
import '../../routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _scaleAnimation = Tween<double>(
      begin: 1.7,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _controller.forward();
    context.read<SplashCubit>().initialize();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context); // initialize screen size
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: BlocListener<SplashCubit, SplashState>(
        listener:  _listener,
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Padding(
            padding: Style.defaultPadding,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: SvgPicture.asset(
                          AssetKeys.splashScreen,
                          width: SizeConfig.screenWidth * 0.26,
                          height: SizeConfig.screenHeight * 0.26,
                        ),
                      ),
                    ),
                    Text(
                      "Travenor",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(color: Colors.white),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.02),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _listener(BuildContext viewContext, SplashState state)async {
    await state.when(
      initial: () {},
      loaded: (data) async {
        if (data['args'].isNotEmpty && data['images'].isNotEmpty) {
          for (final url in data['images']) {
            await precacheImage(NetworkImage(url), context);
          }
          Navigator.pushReplacementNamed(
            context,
            Routes.onBoardingScreen,
            arguments: {
              "args": data['args'],
              "images": data['images'],
            },
          );
        } else {
          showDialog(
            context: viewContext,
            barrierDismissible: false,
            builder: (context) => AlertDialog(
              title: Text("No Internet connection" ,style:  Theme.of(context)
                  .textTheme
                  .bodyLarge?.copyWith(
                fontSize: 20,
                color: Style.primaryColor
              )),
              content: Text(
                  "Your app is not connected to the internet. Please check your internet connection and try again.",
              style: Theme.of(context).textTheme.bodyMedium,),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(viewContext).pop();
                    viewContext.read<SplashCubit>().initialize();
                  },
                  child: Text("Try Again",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge?.copyWith(
                          fontSize: 20,
                          color: Style.primaryColor
                      )),
                ),
                TextButton(
                  onPressed: () {
                    exit(0);
                  },
                  child: Text("Exit",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge?.copyWith(
                          fontSize: 20,
                          color: Style.primaryColor
                      )),
                ),
              ],
            ),
          );
        }
      },
      loggedIn: () {
        Log.i("🔔logged in with user:");
        Navigator.pushReplacementNamed(viewContext, Routes.dashboardScreen);
      },
    );
  }
}
