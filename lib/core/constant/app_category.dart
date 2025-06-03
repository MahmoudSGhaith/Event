import 'package:event/core/resources/assets/assets_manger.dart';
import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

class AppCategory {
  int? id;
  String? name;
  IconData? iconData;
  String ? imagePath;
  AppCategory({this.id, this.name, this.iconData , this.imagePath});


  static List<AppCategory> categoriesWithAll(BuildContext context) {
    return [
      AppCategory(
        id: 0,
        name: AppLocalizations.of(context)!.all,
        iconData: Icons.explore_outlined,
      ),
      AppCategory(
        id: 1,
        name: AppLocalizations.of(context)!.sports,
        iconData: Icons.directions_bike,
        imagePath: AssetsManger.sports
      ),
      AppCategory(
        id: 2,
        name: AppLocalizations.of(context)!.birthday,
        iconData: Icons.cake_outlined,
          imagePath: AssetsManger.birthday
      ),
      AppCategory(
        id: 3,
        name: AppLocalizations.of(context)!.meeting,
        iconData: Icons.group_outlined,
          imagePath: AssetsManger.meeting
      ),
      AppCategory(
        id: 4,
        name: AppLocalizations.of(context)!.gaming,
        iconData: Icons.sports_esports_outlined,
          imagePath: AssetsManger.gaming
      ),
      AppCategory(
        id: 5,
        name: AppLocalizations.of(context)!.eating,
        iconData: Icons.fastfood_outlined,
          imagePath: AssetsManger.eating
      ),
      AppCategory(
        id: 6,
        name: AppLocalizations.of(context)!.holiday,
        iconData: Icons.beach_access_outlined,
          imagePath: AssetsManger.holiday
      ),
      AppCategory(
        id: 7,
        name: AppLocalizations.of(context)!.exhibition,
        iconData: Icons.photo_library_outlined,
          imagePath: AssetsManger.exhibition
      ),
      AppCategory(
        id: 8,
        name: AppLocalizations.of(context)!.workshop,
        iconData: Icons.build_outlined,
          imagePath: AssetsManger.workshop
      ),
      AppCategory(
        id: 9,
        name: AppLocalizations.of(context)!.book_club,
        iconData: Icons.library_books_outlined,
          imagePath: AssetsManger.bookClub
      ),
    ];
  }

  static List<AppCategory> categoriesWithOutAll(BuildContext context) {
    return [
      AppCategory(
          id: 1,
          name: AppLocalizations.of(context)!.sports,
          iconData: Icons.directions_bike,
          imagePath: AssetsManger.sports
      ),
      AppCategory(
          id: 2,
          name: AppLocalizations.of(context)!.birthday,
          iconData: Icons.cake_outlined,
          imagePath: AssetsManger.birthday
      ),
      AppCategory(
          id: 3,
          name: AppLocalizations.of(context)!.meeting,
          iconData: Icons.group_outlined,
          imagePath: AssetsManger.meeting
      ),
      AppCategory(
          id: 4,
          name: AppLocalizations.of(context)!.gaming,
          iconData: Icons.sports_esports_outlined,
          imagePath: AssetsManger.gaming
      ),
      AppCategory(
          id: 5,
          name: AppLocalizations.of(context)!.eating,
          iconData: Icons.fastfood_outlined,
          imagePath: AssetsManger.eating
      ),
      AppCategory(
          id: 6,
          name: AppLocalizations.of(context)!.holiday,
          iconData: Icons.beach_access_outlined,
          imagePath: AssetsManger.holiday
      ),
      AppCategory(
          id: 7,
          name: AppLocalizations.of(context)!.exhibition,
          iconData: Icons.photo_library_outlined,
          imagePath: AssetsManger.exhibition
      ),
      AppCategory(
          id: 8,
          name: AppLocalizations.of(context)!.workshop,
          iconData: Icons.build_outlined,
          imagePath: AssetsManger.workshop
      ),
      AppCategory(
          id: 9,
          name: AppLocalizations.of(context)!.book_club,
          iconData: Icons.library_books_outlined,
          imagePath: AssetsManger.bookClub
      ),
    ];
  }
}
