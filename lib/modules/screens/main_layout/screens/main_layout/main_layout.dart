
import 'package:event/core/resources/routes/app_routes.dart';
import 'package:event/l10n/app_localizations.dart';
import 'package:event/modules/screens/main_layout/manger/layout_provider.dart';
import 'package:event/modules/screens/main_layout/screens/home_tab/home.dart';
import 'package:event/modules/screens/main_layout/screens/love_tab/love.dart';
import 'package:event/modules/screens/main_layout/screens/map_tab/map_tab.dart';
import 'package:event/modules/screens/main_layout/screens/profile_tab/profile.dart';
import 'package:event/modules/screens/main_layout/manger/layout_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/resources/colors/colors_manger.dart';

class MainLayout extends StatefulWidget {
  MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  List<Widget> tabs = [Home(), MapTab(), Love(), Profile()];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LayoutProvider()..getEvent(context),
      child: Consumer<LayoutProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.createEvent).then((value) {
                  provider.getEvent(context);
                },);
              },
              child: Icon(Icons.add, color: ColorsManger.white, size: 30),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            body: tabs[selectedIndex],
            bottomNavigationBar: buildBottomNavigationBar(),
          );
        },
      ),
    );
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(selectedIndex == 0 ? Icons.home : Icons.home_outlined),
          label: AppLocalizations.of(context)!.home,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            selectedIndex == 1 ? Icons.location_on : Icons.location_on_outlined,
          ),
          label: AppLocalizations.of(context)!.map,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            selectedIndex == 2
                ? Icons.favorite
                : Icons.favorite_outline,
          ),
          label: AppLocalizations.of(context)!.favourite,
        ),
        BottomNavigationBarItem(
          icon: Icon(selectedIndex == 3 ? Icons.person : Icons.person_outline),
          label: AppLocalizations.of(context)!.profile,
        ),
      ],
      currentIndex: selectedIndex,
      onTap: onBottomNavigationBarItemClicked,
    );
  }

  void onBottomNavigationBarItemClicked(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }
}
