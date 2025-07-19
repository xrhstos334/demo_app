import 'package:demo_app/core/constants/style.dart';
import 'package:demo_app/core/utils/size_config.dart';
import 'package:demo_app/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/fonts.dart';
import '../../../core/utils/keys/asset_keys.dart';
import '../../../routes/routes.dart';
import '../../widgets/destination_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) async {
        for (final url in state.places
            .map((place) => place.imageUrl)
            .where((url) => url != null)) {
          await precacheImage(NetworkImage(url!), context);
        }
        for (final url in state.avatarUrls) {
          await precacheImage(NetworkImage(url), context);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Style.lightGrayColor),
                        child: Row(
                          children: [
                            CircleAvatar(
                              // Replace with your avatar image
                              // backgroundImage: NetworkImage('https://www.istockphoto.com/photo/eye-of-model-with-colorful-art-make-up-close-up-gm814423752-131755775'), // Placeholder image
                              radius: 20,
                              // Replace with your avatar image
                              // backgroundImage: NetworkImage('https://www.istockphoto.com/photo/eye-of-model-with-colorful-art-make-up-close-up-gm814423752-131755775'), // Placeholder image
                              child: Icon(Icons.person, color: Colors.white),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              state.authUser?.displayName ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.black,
                                    fontFamily: Fonts.sfUI,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Row(
                              children: [
                                Text(
                                  "${state.weather?.name ?? ""} ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontFamily: Fonts.sfUI,
                                        color: Style.lightTextColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  "${state.weather?.temp ?? ""}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontFamily: Fonts.sfUI,
                                        color: Style.lightTextColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                )
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.notifications_none,
                                color: Colors.black),
                            onPressed: () {
                             Navigator.pushNamed(context, Routes.notifications);

                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        height: 1.2,
                      ),
                      children: [
                        TextSpan(
                          text: 'Explore the\n',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontFamily: Fonts.sfUI,
                                    color: Style.lightTextColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                        TextSpan(
                          text: 'Beautiful ',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontFamily: Fonts.sfUI,
                                    color: Style.lightTextColor,
                                    fontSize: 38,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.baseline,
                          baseline: TextBaseline.alphabetic,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "world!",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      fontFamily: Fonts.sfUI,
                                      fontSize: 38,
                                      color: Style.secondaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              SvgPicture.asset(
                                AssetKeys.line,
                                height: 8,
                                width: 70,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  // Best Destination Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Best Destination',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'View all',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontFamily: Fonts.sfUI,
                                    color: Style.secondaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  // Horizontal Scrollable Cards
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.5,
                    child: ListView.builder(
                      itemCount: state.places.length,
                      // Adjust based on the number of cards you want to show
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final place = state.places[index];
                        return DestinationCard(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.details,
                              arguments: {
                                "place": place,
                                "user": state.authUser,
                                "places": state.places,
                                "avatarUrls": state.avatarUrls,
                              },
                            );
                          },
                          imagePath: place.imageUrl,
                          title: place.name,
                          location: place.place,
                          rating: place.rating,
                          friendsCount: place.users.length,
                          friendsAvatars: state.avatarUrls,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  // You can add more sections here based on your design
                ],
              ),
            ),
        );
      },
    );
  }
}
