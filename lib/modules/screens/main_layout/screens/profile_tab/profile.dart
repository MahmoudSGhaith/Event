import 'package:event/core/resources/assets/assets_manger.dart';
import 'package:event/core/resources/colors/colors_manger.dart';
import 'package:event/core/resources/extension/extension.dart';
import 'package:event/core/resources/routes/app_routes.dart';
import 'package:event/core/resources/styles/styles_manger.dart';
import 'package:event/providers/config_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../l10n/app_localizations.dart';
import 'drop_down_menue.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    var configProvider = Provider.of<ConfigProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
              color: ColorsManger.primary,
            ),
            width: double.infinity,
            height: context.screenHeight * 0.27,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: context.screenHeight * 0.01,
                  ),
                  width: 100,
                  height: 125,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                      topRight: Radius.circular(100),
                    ),
                    image: DecorationImage(
                      image: AssetImage(AssetsManger.omra),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Expanded( // Use Expanded to prevent overflow
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Welcome ${FirebaseAuth.instance.currentUser?.displayName?.toUpperCase() ?? ""}",
                          style: StylesManger.medium18white,
                        ),
                        SizedBox(height: 8),
                        Text(
                          FirebaseAuth.instance.currentUser?.email ?? "",
                          style: StylesManger.medium18white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropDownMenu(
                  dropDownTextView:
                  configProvider.isEnglish ? "English" : "عربي",
                  selectedComponent:
                  AppLocalizations.of(context)!.select_language,
                  dropDownItems: ["English", "عربي"],
                  dropDownTitle: AppLocalizations.of(context)!.language,
                  onChange: (newLanguage) {
                    configProvider.changeAppLanguage(
                      newLanguage == "English" ? "en" : "ar",
                    );
                  },
                ),
                SizedBox(height: 25),
                DropDownMenu(
                  dropDownTextView:
                  configProvider.isLight
                      ? AppLocalizations.of(context)!.light
                      : AppLocalizations.of(context)!.dark,
                  selectedComponent: AppLocalizations.of(context)!.select_theme,
                  dropDownItems: [
                    AppLocalizations.of(context)!.dark,
                    AppLocalizations.of(context)!.light,
                  ],
                  dropDownTitle: AppLocalizations.of(context)!.theme,
                  onChange: (newTheme) {
                    configProvider.changeAppTheme(
                      newTheme == AppLocalizations.of(context)!.light ? ThemeMode.light : ThemeMode.dark,
                    );
                  },
                ),
                SizedBox(height: context.screenHeight*0.18),
                SizedBox(
                  width: double.infinity,
                  height: 70,
                  child: FloatingActionButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: Colors.red,
                    onPressed: () async{
                      await FirebaseAuth.instance.signOut();
                      Navigator.pushReplacementNamed(context , AppRoutes.login);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.logout, size: 25, color: ColorsManger.white),
                        SizedBox(width: 25),
                        Text(
                          AppLocalizations.of(context)!.logout,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
