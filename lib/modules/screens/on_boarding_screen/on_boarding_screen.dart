import 'package:event/core/resources/extension/extension.dart';
import 'package:event/core/resources/extension/extension.dart';
import 'package:event/core/resources/extension/extension.dart';
import 'package:event/core/resources/extension/extension.dart';
import 'package:event/core/resources/extension/extension.dart';
import 'package:event/core/resources/extension/extension.dart';
import 'package:event/core/resources/extension/extension.dart';
import 'package:event/core/resources/extension/extension.dart';
import 'package:event/core/resources/extension/extension.dart';
import 'package:event/core/resources/routes/app_routes.dart';
import 'package:event/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../../core/resources/assets/assets_manger.dart';
import '../../../core/resources/colors/colors_manger.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late double heightQuery;

  @override
  Widget build(BuildContext context) {
    heightQuery = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          pages: [
            buildPageViewModel(
              title: context.localization.on_boarding_first_screen_title,
              text: context.localization.on_boarding_first_screen_description,
              imagePath: AssetsManger.onBoardingLight1,
              // height: 0.05,
            ),
            buildPageViewModel(
              title: context.localization.on_boarding_second_screen_title,
              text: context.localization.on_boarding_second_screen_description,
              imagePath: AssetsManger.onBoardingLight2,
              //height: 0.05,
            ),
            buildPageViewModel(
              title: context.localization.on_boarding_third_screen_title,
              text: context.localization.on_boarding_third_screen_description,
              imagePath: AssetsManger.onBoardingLight3,
              //height: 0.05,
            ),
          ],
          globalHeader: Image(
            image: AssetImage(AssetsManger.head),
            height: heightQuery * 0.09,
          ),
          showBackButton: true,
          back: Text(context.localization.back, style: TextStyle(color: ColorsManger.primary)),
          showNextButton: true,
          next: Text(context.localization.next, style: TextStyle(color: ColorsManger.primary)),
          showDoneButton: true,
          done: Text(context.localization.done, style: TextStyle(color: ColorsManger.primary)),
          dotsDecorator: DotsDecorator(
            color: Colors.grey,
            activeColor: ColorsManger.primary,
            size: Size(5, 5),
            activeSize: Size(20, 8),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onDone: () {
            Navigator.pushReplacementNamed(context, AppRoutes.login);
          },
        ),
      ),
    );
  }

  PageViewModel buildPageViewModel({
    required String title,
    required String text,
    required String imagePath,
    //required double height,
  }) {
    return PageViewModel(
      title: "",
      bodyWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: heightQuery * 0.05),
            child: Image(
              image: AssetImage(imagePath),
              height: heightQuery * 0.45,
            ),
          ),
          Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          SizedBox(height: heightQuery * 0.03),
          Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
