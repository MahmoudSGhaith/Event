import 'dart:math';

import 'package:flutter/material.dart';

import '../../resources/colors/colors_manger.dart';

class CustomToast {
  static showToast({
    required BuildContext context,
    required String text,
    ToastType type = ToastType.success,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor:
            type == ToastType.error
                ? Colors.red
                : type == ToastType.success
                ? Colors.green
                : Colors.yellow,
        showCloseIcon: true,
        closeIconColor: ColorsManger.white,
        content: Text(
          text,
          style: TextStyle(
            color:
                type == ToastType.error
                    ? ColorsManger.black
                    : type == ToastType.success
                    ? ColorsManger.white
                    : ColorsManger.dark,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

enum ToastType { error, success, warning }
