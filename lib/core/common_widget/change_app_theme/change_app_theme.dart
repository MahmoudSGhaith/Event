
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:event/core/resources/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/config_provider.dart';
import '../../resources/assets/assets_manger.dart';
import '../../resources/colors/colors_manger.dart';
import '../../resources/styles/styles_manger.dart';

class ChangeAppTheme extends StatelessWidget {
  const ChangeAppTheme({super.key});

  @override
  Widget build(BuildContext context) {
    var configProvider = Provider.of<ConfigProvider>(context);
    return Container(
      padding: EdgeInsets.only(
        left: context.screenHeight * 0.02,
        right: context.screenHeight * 0.02,
      ),
      child: Row(
        textDirection: TextDirection.ltr,
        children: [
          Text(context.localization.theme, style: StylesManger.medium18Primary),
          Spacer(),
          //animated toggle style
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: context.screenHeight * 0.02,
            ),
            width: context.screenWidth * 0.25,
            height: context.screenHeight * 0.052,
            child: AnimatedToggleSwitch<ThemeMode>.rolling(
              current: configProvider.currentTheme,
              values: [ThemeMode.light, ThemeMode.dark],
              onChanged: (newTheme) {
                configProvider.changeAppTheme(newTheme);
              },
              style: ToggleStyle(
                backgroundColor: Colors.transparent,
                borderColor: ColorsManger.primary,
                indicatorColor: ColorsManger.primary,
              ),
              indicatorSize: Size(
                context.screenWidth * 0.22,
                context.screenHeight * 0.052,
              ),
              iconList: [
                Image(
                  image: AssetImage(AssetsManger.light),
                  width: context.screenWidth * 0.09,
                ),
                Image(
                  image: AssetImage(AssetsManger.dark),
                  color:
                  configProvider.currentTheme == ThemeMode.light
                      ? null
                      : ColorsManger.light,
                  width: context.screenWidth * 0.09,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
