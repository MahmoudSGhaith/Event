
import 'package:event/core/constant/app_category.dart';
import 'package:event/core/resources/extension/extension.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  final List<AppCategory> categories;
  final int? selectedIndex;
  final Color selectTabBG;
  final Color unSelectTabBG;
  final Color selectedTabComponentColor;
  final Color unSelectedTabComponentColor;
  final Color selectedBorderColor;
  final Color unSelectedBorderColor;
  final Function(int)? onTabChanged;

  const CustomTabBar({
    super.key,
    required this.categories,
    this.selectedIndex,
    required this.selectTabBG,
    required this.unSelectTabBG,
    required this.selectedTabComponentColor,
    required this.unSelectedTabComponentColor,
    required this.selectedBorderColor,
    required this.unSelectedBorderColor,
    this.onTabChanged,
  });

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: selectedIndex,
      length: widget.categories.length,
      child: TabBar(
        isScrollable: true,
        labelColor: Colors.transparent,
        onTap: onTabBarItemClick,
        dividerColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        labelPadding: EdgeInsets.symmetric(
          horizontal: context.screenWidth * 0.005,
        ),
        tabs:
          widget.categories.map((categories) {
            return buildTabComponent(
              categories: categories,
              isSelected:
                  widget.categories.indexOf(categories) == selectedIndex,
            );
          }).toList(),
      ),
    );
  }

  Widget buildTabComponent({
    required AppCategory categories,
    required bool isSelected,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? widget.selectTabBG : widget.unSelectTabBG,
        border: Border.all(
          color:
              isSelected
                  ? widget.selectedBorderColor
                  : widget.unSelectedBorderColor,
          width: 1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Row(
        children: [
          Icon(
            categories.iconData,
            color:
                isSelected
                    ? widget.selectedTabComponentColor
                    : widget.unSelectedTabComponentColor,
          ),
          SizedBox(width: context.screenWidth * 0.02),
          Text(
            categories.name!,
            style: TextStyle(
              color:
                  isSelected
                      ? widget.selectedTabComponentColor
                      : widget.unSelectedTabComponentColor,
            ),
          ),
        ],
      ),
    );
  }
  void onTabBarItemClick(int newIndex){
    setState(() {
      selectedIndex = newIndex;
    });
    widget.onTabChanged?.call(newIndex);
  }
}
