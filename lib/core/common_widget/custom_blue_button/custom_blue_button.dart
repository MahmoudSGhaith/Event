import 'package:event/core/resources/extension/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/colors/colors_manger.dart';
import '../../resources/styles/styles_manger.dart';


class CustomBlueButton extends StatelessWidget {
  final String title;
  final void Function() onClick;
  final bool isLoading;

  const CustomBlueButton({
    super.key,
    required this.title,
    required this.onClick,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onClick,
      color: ColorsManger.primary,
      child: AnimatedCrossFade(
        firstChild: SizedBox(
          height: context.screenHeight * 0.04,
          width: double.infinity,
          child: Center(child: Text(title, style: StylesManger.medium18white)),
        ),
        secondChild: CupertinoActivityIndicator(color: ColorsManger.white),
        crossFadeState:
            isLoading ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: Duration(milliseconds: 500),
      ),
    );
  }
}
