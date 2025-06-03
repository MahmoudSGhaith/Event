import 'package:event/modules/screens/main_layout/screens/create_event/selected_location.dart';
import 'package:event/modules/screens/main_layout/screens/main_layout/main_layout.dart';
import 'package:event/modules/screens/main_layout/screens/love_tab/love.dart';
import 'package:event/modules/screens/main_layout/screens/map_tab/map_tab.dart';
import 'package:event/modules/screens/main_layout/screens/profile_tab/profile.dart';
import 'package:event/modules/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import '../../../authentication/screens/log_in/sign_in.dart';
import '../../../authentication/screens/reset_password/reset_password.dart';
import '../../../authentication/screens/sign_up/Register.dart';
import '../../../modules/screens/main_layout/screens/create_event/create_event.dart';
import '../../../modules/screens/main_layout/screens/home_tab/home.dart';
import '../../../modules/screens/welcome/welcome_screen.dart';

class AppRoutes {

  static const String welcomeScreen = "welcomeScreen";
  static const String onBoardingScreen = "OnBoardingScreen";
  static const String login = "login";
  static const String register = "Register";
  static const String resetPassword = "ResetPassword";
  static const String layout = "Layout";
  static const String home = "Home";
  static const String love = "Love";
  static const String map = "Map";
  static const String profile = "Profile";
  static const String createEvent = "CreateEvent";
  static const String selectedLocation = "selectedLocation";

  static Map<String , WidgetBuilder> appRoutes = {
    welcomeScreen : (context) => WelcomeScreen(),
    onBoardingScreen : (context) => OnBoardingScreen(),
    login : (context) => SignIn(),
    register : (context) => Register(),
    resetPassword : (context) => ResetPassword(),
    layout : (context) => MainLayout(),
    home : (context) => Home(),
    love : (context) => Love(),
    map : (context) => MapTab(),
    profile : (context) => Profile(),
    createEvent : (context) => CreateEvent(),
    selectedLocation : (context) => SelectedLocation()
  };
}