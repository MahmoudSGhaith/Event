
import 'package:event/core/resources/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/event_model/event_model.dart';
import '../../../../../core/resources/colors/colors_manger.dart';
import '../../../../../core/resources/styles/styles_manger.dart';

class EventComponent extends StatelessWidget {
  final String imagePath;
  final EventModel event;
  const EventComponent({
    super.key,
    required this.imagePath,
    required this.event
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).canvasColor),
        borderRadius: BorderRadius.circular(20),
        color: ColorsManger.primary,
        image: DecorationImage(
          image: AssetImage(event.categoryImage),
          fit: BoxFit.cover,
        ),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.03,
        vertical: context.screenHeight * 0.005,
      ),
      width: double.infinity,
      height: context.screenHeight * 0.28,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorsManger.white,
            ),
            alignment: Alignment.topLeft,
            margin: EdgeInsets.all(8),
            width: context.screenWidth * 0.14,
            height: context.screenHeight * 0.075,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: Text("${event.eventDate.day}" , style: StylesManger.bold15black,)),
                Text(DateFormat.MMM().format(event.eventDate), style: StylesManger.bold15black,),
              ],
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: ColorsManger.white),
              borderRadius: BorderRadius.circular(18),
              color: Theme.of(context).splashColor,
            ),
            margin: EdgeInsets.all(8),
            width: double.infinity,
            height: context.screenHeight * 0.065,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    event.title,
                    style:
                    Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Icon(
                  Icons.favorite_outline,
                  color: ColorsManger.red,
                  size: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}