import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/constants/fonts.dart';
import '../../core/constants/style.dart';
import '../../core/utils/keys/asset_keys.dart';
import '../../core/utils/size_config.dart';

class DestinationCard extends StatelessWidget {
  final String? imagePath;
  final String title;
  final String location;
  final double rating;
  final int friendsCount;
  final Function() onTap;
  final List<String> friendsAvatars;

  const DestinationCard(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.location,
      required this.rating,
      required this.friendsCount,
      required this.onTap,
      required this.friendsAvatars
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: SizeConfig.screenWidth * 0.7,
        margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * 0.02,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imagePath == null
                ? const SizedBox()
                : ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(20)),
                    child: Image.network(
                      imagePath!,
                      height:
                          SizeConfig.screenHeight * 0.4, // Adjust image height
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontFamily: Fonts.sfUI,
                                    color: Style.lightTextColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Style.lightStar, size: 18),
                          const SizedBox(width: 4),
                          Text(
                            '$rating',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontFamily: Fonts.sfUI,
                                  color: Style.lightTextColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(AssetKeys.location,
                              colorFilter: ColorFilter.mode(
                                  Style.lightSubTextColor, BlendMode.srcIn),
                              height: 16),
                          const SizedBox(width: 4),
                          Text(
                            location,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontFamily: Fonts.sfUI,
                                  color: Style.lightSubTextColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                        ],
                      ),
                      friendsCount == 0 ? SizedBox() : SizedBox(
                        height: 30,
                        width: SizeConfig.screenWidth * 0.2,
                        // Adjust width as needed
                        child: Stack(
                          children: [
                            Positioned(
                                right: 30,
                                child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.green[100],
                                    child: Image.network(
                                        height: 18,
                                        friendsAvatars[Random().nextInt(friendsAvatars.length)]
                                    ))),

                            Positioned(
                                right: 20,
                                child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.green[100],
                                    child: Image.network(
                                        height: 18,
                                        friendsAvatars[Random().nextInt(friendsAvatars.length)]
                                    ))),

                            Positioned(
                              right: 10,
                              child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.green[100],
                               child: Image.network(
                                 height: 18,
                                 friendsAvatars[Random().nextInt(friendsAvatars.length)]
                               )),
                            ),
                            Positioned(
                              right: 0,
                              child: CircleAvatar(
                                  radius: 10, backgroundColor: Colors.blue[100],
                                child: Text(
                                  '+$friendsCount',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                    fontFamily: Fonts.sfUI,
                                    color: Style.lightTextColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),

                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
