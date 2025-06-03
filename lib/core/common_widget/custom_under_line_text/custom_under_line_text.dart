import 'package:flutter/material.dart';

class CustomUnderLineText extends StatelessWidget {
  final String title;
  final Function() onClick;
  const CustomUnderLineText({super.key, required this.title , required this.onClick});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero, // removes default padding
        minimumSize: Size(0, 0),  // optional: removes min size
        tapTargetSize: MaterialTapTargetSize.shrinkWrap, // optional: tighter touch area
      ),
      onPressed: onClick,
      child: Text(title, style: Theme.of(context).textTheme.labelSmall),
    );
  }
}
