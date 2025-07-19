import 'package:flutter/material.dart';
import '../../core/constants/style.dart';

class CommonBackButton extends StatelessWidget {
  final Function()? onTap;
  const CommonBackButton({super.key,
  required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.topLeft,
      child: GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          backgroundColor: Style.lightTextColor.withValues(alpha: 0.06),
          radius: 20,
          child: Icon(Icons.arrow_back_ios_new, size: 14),
        ),
      ),
    );
  }
}
