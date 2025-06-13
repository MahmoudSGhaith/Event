import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EventModel {
  String? id;
  String title;
  String description;
  DateTime eventDate;
  int eventTime;
  String categoryId;
  String categoryImage;
  bool isFavorite;

  EventModel({
    this.id,
    required this.title,
    required this.description,
    required this.eventDate,
    required this.eventTime,
    required this.categoryId,
    required this.categoryImage,
    this.isFavorite = false,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      eventDate: (json["eventDate"] as Timestamp).toDate(),
      eventTime: json["eventTime"],
      categoryId: json["categoryId"],
      categoryImage: json["categoryImage"],
      isFavorite: json["isFavorite"] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "eventDate": eventDate,
      "eventTime": eventTime,
      "categoryId": categoryId,
      "categoryImage": categoryImage,
      "isFavorite": isFavorite,
    };
  }
}
