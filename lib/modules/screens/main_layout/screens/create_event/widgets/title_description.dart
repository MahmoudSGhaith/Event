import 'package:event/core/resources/extension/extension.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/common_widget/custom_text_form_field/custome_text_form_field.dart';

typedef MyValidator = String? Function(String?)?;

class TitleDescription extends StatelessWidget {
  final String title;
  final String labelText;
  final IconData? icon;
  final int lines;
  final MyValidator validator;
  final TextEditingController? controller;

  const TitleDescription({
    super.key,
    required this.title,
    required this.labelText,
    this.icon,
    required this.lines,
    this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: context.screenHeight * 0.01),
          child: Text(title, style: Theme.of(context).textTheme.titleMedium),
        ),
        SizedBox(height: context.screenHeight * 0.01),
        Container(
          margin: EdgeInsets.symmetric(horizontal: context.screenHeight * 0.01),
          child: CustomTextFormField(
            validator: validator,
            controller: controller,
            lines: lines,
            labelText: labelText,
            prefixIcon: icon,
          ),
        ),
      ],
    );
  }
}
