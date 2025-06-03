import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import '../../../../core/resources/colors/colors_manger.dart';
import '../../../../core/resources/styles/styles_manger.dart';

class ToggleSwitch extends StatelessWidget {
  final String title;
  final String firstImagePath;
  final String secondImagePath;

  const ToggleSwitch({
    super.key,
    required this.title,
    required this.firstImagePath,
    required this.secondImagePath,
  });

  @override
  Widget build(BuildContext context) {
    var heightQuery = MediaQuery.of(context).size.height;
    var widthQuery = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(
        left: heightQuery * 0.02,
        right: heightQuery * 0.005,
      ),
      child: Row(
        children: [
          Text(title, style: StylesManger.medium18Primary),
          Spacer(),
          //animated toggle style
          Container(
            margin: EdgeInsets.symmetric(horizontal: heightQuery * 0.02),
            width: widthQuery * 0.25,
            height: heightQuery * 0.052,
            child: AnimatedToggleSwitch<int>.rolling(
              current: 0,
              values: [0, 1],
              style: ToggleStyle(
                backgroundColor: Colors.transparent,
                borderColor: ColorsManger.primary,
                indicatorColor: ColorsManger.primary,
              ),
              indicatorSize: Size(widthQuery * 0.22, heightQuery * 0.052),
              iconList: [
                Image(
                  image: AssetImage(firstImagePath),
                  width: widthQuery * 0.09,
                ),
                Image(
                  image: AssetImage(secondImagePath),
                  width: widthQuery * 0.09,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
