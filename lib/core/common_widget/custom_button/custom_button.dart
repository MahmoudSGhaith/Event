import 'package:event/core/resources/extension/extension.dart';
import 'package:flutter/material.dart';

import '../../resources/colors/colors_manger.dart';

class CustomButton extends StatefulWidget {
  final IconData icon;
  final String title;
  final void Function() onClick;

  const CustomButton({super.key, required this.icon, required this.title , required this.onClick});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onClick,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent,
          border: Border.all(color: ColorsManger.primary),
        ),
        width: double.infinity,
        height: context.screenHeight * 0.09,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: context.screenHeight*0.015),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorsManger.primary,
              ),
              alignment: Alignment.center,

              width: context.screenWidth * 0.15,
              height: context.screenHeight * 0.07,
              child: Icon(Icons.my_location, color: ColorsManger.white),
            ),
            Spacer(),
            Text(widget.title, style: Theme.of(context).textTheme.displaySmall),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward,
                color: ColorsManger.primary,
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
