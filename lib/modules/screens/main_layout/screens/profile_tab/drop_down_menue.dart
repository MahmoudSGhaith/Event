
import 'package:event/core/resources/extension/extension.dart';
import 'package:event/core/resources/styles/styles_manger.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/colors/colors_manger.dart';

class DropDownMenu extends StatelessWidget {
  String dropDownTextView;
  List<String> dropDownItems;
  final void Function(String?) onChange;
  String selectedComponent;
  String dropDownTitle;

  DropDownMenu({
    super.key,
    required this.dropDownTextView,
    required this.dropDownTitle,
    required this.selectedComponent,
    required this.dropDownItems,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text(dropDownTitle, style: Theme.of(context).textTheme.labelMedium),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Theme.of(context).primaryColorDark, width: 1.5),
          ),
          child: Row(
            children: [
              Text(
                dropDownTextView,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Spacer(),
              Container(
                width: context.screenWidth*0.6,
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: ColorsManger.primary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  dropdownColor: ColorsManger.white,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                    size: 30,
                  ),
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  items:
                  dropDownItems.map((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: StylesManger.medium18black,
                      ),
                    );
                  }).toList(),
                  onChanged: onChange,
                  hint: Text(
                    selectedComponent,
                    style: StylesManger.medium18white.copyWith(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
