import 'package:event/core/resources/extension/extension.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/common_widget/custom_under_line_text/custom_under_line_text.dart';
import '../../../../../../l10n/app_localizations.dart';
typedef MyValidator = String?Function(Object?)?;
class ChooseDateTime extends StatelessWidget {
  final IconData icon;
  final String mainTitle;
  final String chooseTitle;
  final Function() onClick;
  final MyValidator validator;

  const ChooseDateTime({
    super.key,
    required this.icon,
    required this.mainTitle,
    required this.chooseTitle,
    required this.onClick,
    required this.validator
  });

  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: validator,
      builder: (field) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: context.screenHeight * 0.01),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(icon, color: Theme.of(context).hoverColor),
                  Spacer(),
                  Text(mainTitle, style: Theme.of(context).textTheme.titleMedium),
                  Spacer(flex: 4),
                  CustomUnderLineText(title: chooseTitle, onClick: onClick),
                ],
              ),
              if(field.hasError)
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 5.0),
                  child: Text(
                    field.errorText!,
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
