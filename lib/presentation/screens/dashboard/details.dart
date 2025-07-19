import 'dart:math';

import 'package:demo_app/presentation/cubits/details_cubit/details_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/fonts.dart';
import '../../../core/constants/style.dart';
import '../../../core/utils/keys/asset_keys.dart';
import '../../../core/utils/size_config.dart';
import '../../providers/details_enums.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsCubit, DetailsState>(listener: (context, state)async {
      for (final url in state.placesList
          .map((place) => place.imageUrl)
          .where((url) => url != null)) {
        await precacheImage(NetworkImage(url!), context);
      }
      for (final url in state.avatarUrls) {
        await precacheImage(NetworkImage(url), context);
      }
      if (state.view == DetailsView.bookMark) {
      } else if (state.view == DetailsView.back) {
        Navigator.pop(context);
      } else if (state.view == DetailsView.bookNow) {

      }
    }, builder: (context, state) {
      return Scaffold(
        body: CustomScrollView(
          slivers: [
           state.place.imageUrl == null ? SizedBox() : SliverAppBar(
              pinned: true,
              expandedHeight: SizeConfig.screenHeight * 0.55,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  state.place.imageUrl!,
                  fit: BoxFit.cover,
                ),
              ),
              leading: Padding(
                padding: EdgeInsets.only(
                  top:10,
                  left: 16,
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.black.withValues(alpha: 0.15),
                  child: IconButton(
                    icon: Icon(CupertinoIcons.back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(
                      top:10,
                      right: 16,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.black.withValues(alpha: 0.15),
                    child: Icon(Icons.bookmark_border, color: Colors.white),
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.05,
                  vertical: SizeConfig.screenHeight * 0.02,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Container(
                        width: 40,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Style.lightSubTextColor.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.place.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                fontFamily: Fonts.sfUI,
                                fontSize: 24,
                                color: Style.lightTextColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              state.place.place,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                fontFamily: Fonts.sfUI,
                                fontSize: 15,
                                color: Style.lightSubTextColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        CircleAvatar(
                      backgroundColor: Colors.green[100],
                      radius: 25,
                      child: Image.network(
                          height: 70,
                          state.avatarUrls[Random().nextInt(state.avatarUrls.length)]
                      )),
                      ],
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.035),
                    Row(
                      children: <Widget>[
                        SvgPicture.asset(AssetKeys.location,
                            colorFilter: ColorFilter.mode(
                                Style.secondaryLightSubTextColor,
                                BlendMode.srcIn),
                            height: 18),
                        SizedBox(width: 5),
                        Text(
                            state.place.place
                                .split(' ')
                                .first
                                .replaceAll(',', ''),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                              fontFamily: Fonts.sfUI,
                              fontSize: 15,
                              color:
                              Style.secondaryLightSubTextColor,
                            )),
                        SizedBox(width: 20),
                        Icon(Icons.star,
                            color: Style.lightStar, size: 18),
                        Row(
                          children: [
                            Text(state.place.rating.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                  fontFamily: Fonts.sfUI,
                                  fontSize: 16,
                                  color: Style.lightTextColor,
                                )),
                            Text('(2498)',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                  fontFamily: Fonts.sfUI,
                                  fontSize: 16,
                                )),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Text('\$${state.place.price}/',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                  fontFamily: Fonts.sfUI,
                                  fontSize: 15,
                                  color: Style.primaryColor,
                                )),
                            Text(
                              'Person',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                fontFamily: Fonts.sfUI,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    state.placesList.isEmpty
                        ? SizedBox()
                        : SizedBox(
                      height: SizeConfig.screenHeight * 0.05,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.placesList.length,
                        itemBuilder: (context, index) {
                          return _buildCategoryItem(
                            state.placesList[index].imageUrl ?? state.placesList.last.imageUrl!,
                          );
                        },
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                      ),
                    ),
                    // SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   child: Row(
                    //     children: [
                    //       _buildCategoryItem(
                    //           AssetKeys.onBoardingScreen1),
                    //       _buildCategoryItem(
                    //           AssetKeys.onBoardingScreen1),
                    //       _buildCategoryItem(
                    //           AssetKeys.onBoardingScreen1),
                    //       _buildCategoryItem(
                    //           AssetKeys.onBoardingScreen1),
                    //       _buildCategoryItem(
                    //           AssetKeys.onBoardingScreen1),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(height: 20),
                    Text(
                      'About Destination',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(
                        fontWeight: FontWeight.w600,
                        fontFamily: Fonts.sfUI,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      state.place.description,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                        fontFamily: Fonts.sfUI,
                        fontSize: 13,
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),

                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Read More',
                        style: TextStyle(
                          color: Style.secondaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle Book Now
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
                          'Book Now',
                          style: TextStyle(
                              fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                  ],
                )
              ),
            ),

          ],
        ),

      );
    });
  }


  Widget _buildCategoryItem(String imageUrl) {
    return Padding(
      padding: EdgeInsets.only(right:SizeConfig.screenWidth * 0.1),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
