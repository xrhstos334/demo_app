import 'dart:io';

import 'package:demo_app/core/constants/fonts.dart';
import 'package:demo_app/core/utils/keys/asset_keys.dart';
import 'package:demo_app/core/utils/size_config.dart';
import 'package:demo_app/presentation/cubits/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:demo_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/constants/style.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    context.read<OnBoardingCubit>().init();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingState>(
      listener: _listener,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: state.status == OnBoardingStatus.loading
              ? SizedBox()
              : SingleChildScrollView(
                child: Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.6,
                        child: Stack(
                          children: [
                            state.status == OnBoardingStatus.loading
                                ? SizedBox()
                                : PageView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    controller: _pageController,
                                    itemCount: 3,
                                    onPageChanged: (int index) {
                                      context
                                          .read<OnBoardingCubit>()
                                          .incrementPageNumber;
                                    },
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(32),
                                          bottomRight: Radius.circular(32),
                                        ),
                                        child: AnimatedSwitcher(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          transitionBuilder: (Widget child,
                                              Animation<double> animation) {
                                            return FadeTransition(
                                              opacity: animation,
                                              child: child,
                                            );
                                          },
                                          child: Image.network(
                                            state.images[index],
                                            key: ValueKey<String>(
                                              state.images[index],
                                            ),
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            height: double.infinity,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                            Positioned(
                              top: SizeConfig.screenHeight * 0.05,
                              right: SizeConfig.screenWidth * 0.05,
                              child: TextButton(
                                onPressed: () {
                                  context.read<OnBoardingCubit>().skip();
                                },
                                child: Text(
                                  "Skip",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Content
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.4,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                              vertical: 16,
                            ),
                            child: Column(
                              children: [
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: state.titles[state.currentPage],
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              fontSize: 30,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                            ),
                                      ),
                                      WidgetSpan(
                                        alignment: PlaceholderAlignment.baseline,
                                        baseline: TextBaseline.alphabetic,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              state.highlight[state.currentPage],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.copyWith(
                                                    fontSize: 30,
                                                    color: Style.secondaryColor,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                            ),
                                            SvgPicture.asset(
                                              AssetKeys.line,
                                              height: 6,
                                              width: 60,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Flexible(
                                  child: Text(
                                    state.descriptions[state.currentPage],
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontFamily: Fonts.gilSans,
                                        ),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                AnimatedSmoothIndicator(
                                  activeIndex: state.currentPage,
                                  duration: const Duration(milliseconds: 500),
                                  count: 3,
                                  effect: ExpandingDotsEffect(
                                    expansionFactor: 4,
                                    dotWidth: 8.0,
                                    dotHeight: 8.0,
                                    strokeWidth: 1,
                                    activeDotColor: Style.primaryColor,
                                    dotColor:
                                        Style.primaryColor.withValues(alpha: 0.5),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      context
                                          .read<OnBoardingCubit>()
                                          .changePage();
                                      if (state.currentPage < state.titles.length) {
                                        _pageController.animateToPage(
                                          state.currentPage + 1,
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.easeInOut,
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16),
                                    ),
                                    child: const Text(
                                      "Get Started",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
              ),
        );
      },
    );
  }

  void _listener(BuildContext context, OnBoardingState state) async {
    if (state.status == OnBoardingStatus.skip ||
        state.status == OnBoardingStatus.complete) {
      Navigator.pushNamed(context, Routes.loginScreen);
    }else if (state.status == OnBoardingStatus.error) {
      exit(0);
    }
  }
}
