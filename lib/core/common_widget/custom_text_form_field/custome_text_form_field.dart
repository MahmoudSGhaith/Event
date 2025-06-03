import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../resources/colors/colors_manger.dart';


class CustomTextFormField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onClick;
  final int lines;
  final bool isSecure;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.onClick,
    this.lines = 1,
    this.isSecure = false,
    this.controller,
    this.validator,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.top,
      controller: widget.controller,
      validator: widget.validator,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      maxLines: widget.lines,
      obscureText: widget.isSecure,
      style: Theme.of(context).textTheme.labelMedium,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
          color: ColorsManger.grey.withAlpha(200),
        ),
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
          color: ColorsManger.grey.withAlpha(200),
        ),
        prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
        suffixIcon:
            widget.suffixIcon != null
                ? IconButton(
                  onPressed: widget.onClick,
                  icon: Icon(widget.suffixIcon),
                )
                : null,
      ),
    );
  }
}
