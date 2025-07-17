import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/style.dart';

class BottomBarButton extends StatelessWidget {
  const BottomBarButton(
      {super.key,
      required this.title,
      required this.onTap,
      required this.isSelected,
      required this.path});
  final String title;
  final GestureTapCallback? onTap;
  final bool isSelected;
  final String path;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              path,
              height: 27,
              colorFilter: ColorFilter.mode(
                  isSelected
                      ? Theme.of(context).primaryColor
                      : Style.lightSubTextColor,
                  BlendMode.srcIn),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              maxLines: 1,
              style: isSelected
                  ? Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Style.primaryColor)
                  : Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Style.lightSubTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
