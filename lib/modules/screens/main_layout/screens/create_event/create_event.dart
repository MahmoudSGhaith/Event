import 'package:event/core/common_widget/custom_blue_button/custom_blue_button.dart';
import 'package:event/core/resources/routes/app_routes.dart';
import 'package:event/modules/screens/main_layout/manger/layout_provider.dart';
import 'package:flutter/material.dart';
import 'package:event/core/constant/app_category.dart';
import 'package:event/core/resources/colors/colors_manger.dart';
import 'package:event/core/resources/extension/extension.dart';
import 'package:event/l10n/app_localizations.dart';
import 'package:event/modules/screens/main_layout/screens/create_event/widgets/choose_date_time.dart';
import 'package:event/modules/screens/main_layout/screens/create_event/widgets/title_description.dart';
import 'package:event/modules/screens/main_layout/screens/main_layout/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common_widget/custom_button/custom_button.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  int selectedImage = 0;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? dateError;
  String? timeError;
  final formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  LatLng? location;

  @override
  Widget build(BuildContext context) {
    List<AppCategory> categories = AppCategory.categoriesWithOutAll(context);
    AppCategory category = categories[selectedImage];
    return Consumer<LayoutProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.create_event),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // show image
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: context.screenWidth * 0.04,
                      vertical: context.screenHeight * 0.015,
                    ),
                    width: double.infinity,
                    height: context.screenHeight * 0.28,
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).canvasColor),
                      borderRadius: BorderRadius.circular(20),
                      image:
                          category.imagePath != null
                              ? DecorationImage(
                                image: AssetImage(category.imagePath!),
                                fit: BoxFit.fill,
                              )
                              : null,
                    ),
                  ),
                  SizedBox(height: context.screenHeight * 0.02),
                  // custom tab bar
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: context.screenHeight * 0.01,
                    ),
                    child: CustomTabBar(
                      onTabChanged: (newImage) {
                        selectedImage = newImage;
                        setState(() {});
                      },
                      categories: AppCategory.categoriesWithOutAll(context),
                      selectedBorderColor: ColorsManger.primary,
                      unSelectedBorderColor: ColorsManger.primary,
                      selectedTabComponentColor: Theme.of(context).splashColor,
                      unSelectedTabComponentColor: ColorsManger.primary,
                      selectTabBG: ColorsManger.primary,
                      unSelectTabBG: Colors.transparent,
                    ),
                  ),
                  SizedBox(height: context.screenHeight * 0.02),
                  // title and text form field for title
                  TitleDescription(
                    validator: (title) {
                      if (title == null || title.isEmpty) {
                        return "please enter event title";
                      }
                    },
                    lines: 1,
                    title: AppLocalizations.of(context)!.title,
                    icon: Icons.edit,
                    labelText: AppLocalizations.of(context)!.event_title,
                    controller: titleController,
                  ),
                  SizedBox(height: context.screenHeight * 0.01),
                  // description and text form field for description
                  TitleDescription(
                    validator: (description) {
                      if (description == null || description.isEmpty) {
                        return "please enter event description";
                      }
                    },
                    lines: 3,
                    title: AppLocalizations.of(context)!.description,
                    labelText: AppLocalizations.of(context)!.event_description,
                    controller: descriptionController,
                  ),
                  SizedBox(height: context.screenHeight * 0.02),
                  //choose event date
                  ChooseDateTime(
                    onClick: () {
                      showEventDate();
                    },
                    validator: (_) {
                      if (selectedDate == null) {
                        return "you must select the event date";
                      } else {
                        return null;
                      }
                    },
                    icon: Icons.calendar_month,
                    mainTitle: AppLocalizations.of(context)!.event_date,
                    chooseTitle:
                        selectedDate != null
                            ? DateFormat('EEE-dd/MM/yyyy').format(selectedDate!)
                            : AppLocalizations.of(context)!.choose_date,
                  ),
                  SizedBox(height: context.screenHeight * 0.02),
                  //choose event time
                  ChooseDateTime(
                    onClick: () {
                      showEventTime();
                    },
                    validator: (_) {
                      if (selectedTime == null) {
                        return "you must select the event time";
                      } else {
                        return null;
                      }
                    },
                    icon: Icons.watch_later_outlined,
                    mainTitle: AppLocalizations.of(context)!.event_time,
                    chooseTitle:
                        selectedTime != null
                            ? selectedTime!.format(context)
                            : AppLocalizations.of(context)!.choose_time,
                  ),
                  SizedBox(height: context.screenHeight * 0.02),
                  // location title
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: context.screenHeight * 0.01,
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.location,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  SizedBox(height: context.screenHeight * 0.01),
                  //choose event location
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: context.screenHeight * 0.01,
                    ),
                    child: CustomButton(
                      onClick: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.selectedLocation,
                        ).then((value) {
                          if (value != null) {
                            location = value as LatLng?;
                            setState(() {});
                          }
                        });
                      },
                      icon: Icons.my_location,
                      title:
                          location != null
                              ? "${location!.latitude}\n${location!.longitude}"
                              : AppLocalizations.of(
                                context,
                              )!.choose_event_location,
                    ),
                  ),
                  SizedBox(height: context.screenHeight * 0.02),
                  //add event button
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: context.screenHeight * 0.01,
                    ),
                    child: CustomBlueButton(
                      title: AppLocalizations.of(context)!.add_event,
                      isLoading: provider.isLoading,
                      onClick: () async {
                        if (formKey.currentState!.validate() && location != null) {
                          final layoutProvider = Provider.of<LayoutProvider>(
                            context,
                            listen: false,
                          );
                          layoutProvider.setSelectedCategory(
                            AppCategory.categoriesWithOutAll(context)[selectedImage],
                            context,
                          );
                          await layoutProvider.addEvent(
                            selectedDate: selectedDate!,
                            selectedTime: selectedTime!,
                            titleController: titleController,
                            descriptionController: descriptionController,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Event Created")),
                          );
                          Navigator.pop(context);
                        } else {
                          String message = "Please fill all required fields!";
                          if (location == null) {
                            message = "Please select a location for the event.";
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(message)),
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(height: context.screenHeight * 0.02),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showEventDate() async {
    final DateTime? pickEventDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (pickEventDate != null) {
      selectedDate = pickEventDate;
      setState(() {});
    }
  }

  void showEventTime() async {
    final TimeOfDay? pickEventTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickEventTime != null) {
      selectedTime = pickEventTime;
      setState(() {});
    }
  }
}
