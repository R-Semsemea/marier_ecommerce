import 'package:flutter/material.dart';

import '../../../core/constant/screen_dimensions.dart';

class CustomAuthNavigation extends StatelessWidget {
  final String text;
  final String navText;
  final void Function()? onTap;
  final bool isWaiting;

  const CustomAuthNavigation(
      {Key? key,
      required this.text,
      required this.navText,
      this.onTap,
      this.isWaiting = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: ScreenDimension.height * 0.0837,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(text, style: Theme.of(context).textTheme.bodySmall),
          InkWell(
            onTap: isWaiting ? null : onTap,
            child: Text(
              navText,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
