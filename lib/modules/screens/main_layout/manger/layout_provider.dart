import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event/core/constant/app_category.dart';
import 'package:event/services/fire_base_fire_store_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/event_model/event_model.dart';

class LayoutProvider extends ChangeNotifier {

  List<EventModel> events = [];

  bool isLoading = false;


  int selectedIndex = 0;
  User get user => FirebaseAuth.instance.currentUser!;
  AppCategory? selectedCategory;
  Future<void> setSelectedCategory(AppCategory category , BuildContext context)async {
    selectedCategory = category;
    await getEvent(context);
  }



  Future<void> addEvent({
    required TextEditingController titleController,
    required TextEditingController descriptionController,
    required DateTime selectedDate,
    required TimeOfDay selectedTime,
  }) async {
    isLoading = true;
    notifyListeners();
    if (selectedCategory == null) {
      throw Exception("Please select a category before creating an event.");
    }
    EventModel model = EventModel(
      title: titleController.text,
      description: descriptionController.text,
      eventDate: selectedDate,
      eventTime: selectedTime.hourOfPeriod,
      categoryId: selectedCategory!.id.toString(),
      categoryImage: selectedCategory!.imagePath ?? "",
    );
    
    await FireBaseFireStoreService.addEvent(model);
    isLoading = false;
    notifyListeners();
  }

  Future<void> getEvent(BuildContext context)async{
    isLoading = true;
    notifyListeners();
    events.clear();
    selectedCategory ??= AppCategory.categoriesWithAll(context)[0];
    List<QueryDocumentSnapshot<EventModel>> data;
    if(selectedCategory!.id == 0){
      data = await FireBaseFireStoreService.getAllEvents();
    }else {
      data = await FireBaseFireStoreService.getEvent(selectedCategory!.id.toString());
    }

    for(var e in data){
      events.add(e.data());
    }
    isLoading = false;
    notifyListeners();
  }
}
