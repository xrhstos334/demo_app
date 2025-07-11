import 'package:demo_app/core/constants/fonts.dart';
import 'package:demo_app/core/utils/keys/asset_keys.dart';
import 'package:demo_app/core/utils/size_config.dart';
import 'package:demo_app/presentation/cubits/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/constants/style.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  List<String> titlesOnBoardingScreen = [
    "Life is short and\nthe world is ",
    "It’s a big world out\nthere go explore",
    "People don’t take trips,\ntrips take people",
  ];

  List<String> endTitle = [
    "wide",
    "explore",
    "people",
  ];

  List<String> textsOnBoardingScreen = [
    "At Friends tours and travel, we customize reliable and trutworthy educational tours to destinations all over the world",
    "To get the best of your adventure you just need to leave and go where you like. we are waiting for you",
    "To get the best of your adventure you just need to leave and go where you like. we are waiting for you",
  ];

  List<String> listImagesOnBoardingScreen = [
    AssetKeys.onBoardingScreen1,
    AssetKeys.onBoardingScreen2,
    AssetKeys.onBoardingScreen3
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingState>(
      listener:_listener,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Expanded(
                flex: 6,
                child: Stack(
                  children: [
                    PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _pageController,
                      itemCount: textsOnBoardingScreen.length,
                      onPageChanged: (int index) {
                        context.read<OnBoardingCubit>().incrementPageNumber;
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(32),
                            bottomRight: Radius.circular(32),
                          ),
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            transitionBuilder: (Widget child, Animation<double> animation) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                            child: Image.asset(
                              listImagesOnBoardingScreen[index],
                              key: ValueKey<String>(listImagesOnBoardingScreen[index]),
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
                        onPressed: (){
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
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 16),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: titlesOnBoardingScreen[state.currentPage],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    fontSize: 30,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            TextSpan(
                              text: endTitle[state.currentPage],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: Style.secondaryColor,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        textsOnBoardingScreen[state.currentPage],
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontFamily: Fonts.gilSans,
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
                          dotColor: Style.primaryColor.withValues(alpha: 0.5),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Get Started Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<OnBoardingCubit>().changePage();
                            if (state.currentPage < textsOnBoardingScreen.length - 1) {
                              _pageController.animateToPage(
                                state.currentPage + 1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
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
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _listener(BuildContext context, OnBoardingState state) {
    if (state.status == OnBoardingStatus.skip) {
      Navigator.pushReplacementNamed(context, '/home');
    } else if (state.status == OnBoardingStatus.complete) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }
}
