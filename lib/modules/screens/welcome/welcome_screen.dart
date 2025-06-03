import 'package:animate_do/animate_do.dart';
import 'package:event/core/resources/assets/assets_manger.dart';
import 'package:event/core/resources/extension/extension.dart';
import 'package:event/core/resources/routes/app_routes.dart';
import 'package:event/core/resources/styles/styles_manger.dart';
import 'package:event/l10n/app_localizations.dart';
import 'package:event/providers/config_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/common_widget/change_app_language/change_app_language.dart';
import '../../../core/common_widget/change_app_theme/change_app_theme.dart';
import '../../../core/common_widget/custom_blue_button/custom_blue_button.dart';
import '../../../services/shared_preference_service.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    var configProvider = Provider.of<ConfigProvider>(context);
    var theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FadeInLeft(
              child: Center(
                child: Image(
                  image: AssetImage(AssetsManger.head),
                  width: context.screenWidth * 0.5,
                  height: context.screenHeight * 0.18,
                ),
              ),
            ),
            Center(
              child: FadeInRight(
                child: Image(
                  image: AssetImage(AssetsManger.welcomeScreenLight),
                  height: context.screenHeight * 0.40,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: context.screenHeight * 0.02),
              child: Text(
                context.localization.welcome_screen_title,
                style: StylesManger.bold18Primary,
              ),
            ),
            SizedBox(height: context.screenHeight * 0.01),
            Container(
              padding: EdgeInsets.symmetric(horizontal: context.screenHeight * 0.02),
              child: Text(
                context.localization.welcome_screen_description,
                style: theme.textTheme.titleMedium,
              ),
            ),
            SizedBox(height: context.screenHeight * 0.01),
            ChangeAppLanguage(),
            SizedBox(height: context.screenHeight * 0.01),
            ChangeAppTheme(),
            SizedBox(height: context.screenHeight*0.04,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: context.screenHeight * 0.02),
              child: CustomBlueButton(
                title: AppLocalizations.of(context)!.lets_start,
                onClick: ()async{
                  Navigator.pushReplacementNamed(context, AppRoutes.onBoardingScreen);
                },
              ),
            ),
            SizedBox(height: context.screenHeight * 0.01),
          ],
        ),
      ),
    );
  }
}
