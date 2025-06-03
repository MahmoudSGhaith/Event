import 'package:event/core/constant/app_category.dart';
import 'package:event/core/resources/assets/assets_manger.dart';
import 'package:event/core/resources/colors/colors_manger.dart';
import 'package:event/core/resources/extension/extension.dart';
import 'package:event/core/resources/styles/styles_manger.dart';
import 'package:event/l10n/app_localizations.dart';
import 'package:event/modules/screens/main_layout/manger/layout_provider.dart';
import 'package:event/modules/screens/main_layout/screens/main_layout/custom_tab_bar.dart';
import 'package:event/providers/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'event_component.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    // Delay to next frame to avoid context issues:
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<LayoutProvider>(context, listen: false);
      provider.getEvent(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final categoryList = AppCategory.categoriesWithAll(context);
    var provider = Provider.of<LayoutProvider>(context);
    var appProvider = Provider.of<ConfigProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.screenHeight * 0.02,
                vertical: context.screenWidth * 0.02,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).focusColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      //for welcome back and user name
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //welcome back
                          Text(
                            AppLocalizations.of(context)!.welcome_back,
                            style: StylesManger.medium15white,
                          ),
                          SizedBox(height: context.screenHeight * 0.01),
                          //show user name
                          Text(
                            provider.user.displayName?.toUpperCase() ?? "",
                            style: StylesManger.bold18white,
                          ),
                        ],
                      ),
                      Spacer(),
                      // for show light or dark icon , and EN
                      Row(
                        children: [
                          //for show light or dark icon
                          Image(
                            image:
                                appProvider.currentTheme == ThemeMode.light
                                    ? AssetImage(AssetsManger.light)
                                    : AssetImage(AssetsManger.dark),
                            color: ColorsManger.white,
                            width: context.screenWidth * 0.09,
                          ),
                          SizedBox(width: context.screenHeight * 0.01),
                          //for EN
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: ColorsManger.white,
                            ),
                            alignment: Alignment.center,
                            width: context.screenWidth * 0.09,
                            height: context.screenHeight * 0.045,
                            child: Text(
                              AppLocalizations.of(context)!.en,
                              style: TextStyle(
                                color: ColorsManger.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: context.screenHeight * 0.025),
                  //show location
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 25,
                        color: ColorsManger.white,
                      ),
                      SizedBox(width: context.screenHeight * 0.01),
                      Text("cairo , Egypt", style: StylesManger.medium15white),
                    ],
                  ),
                  SizedBox(height: context.screenHeight * 0.015),
                  CustomTabBar(
                    categories: AppCategory.categoriesWithAll(context),
                    selectedIndex:
                        provider.selectedCategory != null
                            ? categoryList.indexWhere(
                              (c) => c.id == provider.selectedCategory!.id,
                            )
                            : 0,
                    selectTabBG: Theme.of(context).canvasColor,
                    unSelectTabBG: Colors.transparent,
                    selectedTabComponentColor:
                        Theme.of(context).primaryColorDark,
                    unSelectedTabComponentColor: ColorsManger.light,
                    selectedBorderColor: Colors.transparent,
                    unSelectedBorderColor: Theme.of(context).canvasColor,
                    onTabChanged: (int index) {
                      final provider = Provider.of<LayoutProvider>(
                        context,
                        listen: false,
                      );
                      provider.setSelectedCategory(
                        AppCategory.categoriesWithAll(context)[index],
                        context,
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () {
                  return provider.getEvent(context);
                },
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return EventComponent(
                      imagePath: AssetsManger.sports,
                      event: provider.events[index],
                    );
                  },
                  itemCount: provider.events.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
