import 'package:flutter/material.dart';
import 'package:sign_recog/presentation/sign_in_screen.dart';
import 'package:sign_recog/presentation/home_screen_container_screen.dart';
import 'package:sign_recog/presentation/capture_screen.dart';
import 'package:sign_recog/presentation/home_screen_page.dart';
import 'package:sign_recog/presentation/user_logs_screen.dart';
import 'package:sign_recog/presentation/learning_screen.dart';
import 'package:sign_recog/presentation/settings_screen.dart';
import 'package:sign_recog/presentation/profile_screen.dart';
import 'package:sign_recog/presentation/app_navigation_screen.dart';
import 'package:sign_recog/presentation/sign_up_screen.dart';
import 'package:sign_recog/presentation/edit_profile_screen.dart';

class AppRoutes {
  static const String signInScreen = '/sign_in_screen';
  static const String homeScreenContainerScreen = '/home_screen_container_screen';
  static const String homeScreenPage = '/home_screen_page';
  static const String captureScreen = '/capture_screen';
  static const String userLogsScreen = '/user_logs_screen';
  static const String learningScreen = '/learning_screen';
  static const String settingsScreen = '/settings_screen';
  static const String profileScreen = '/profile_screen';
  static const String editProfileScreen = '/edit_profile_screen';
  static const String appNavigationScreen = '/app_navigation_screen';
  static const String signUpScreen = '/sign_up_screen';

  static Map<String, WidgetBuilder> routes = {
    signInScreen: (context) => SignInScreen(),
    homeScreenContainerScreen: (context) => HomeScreenContainerScreen(),
    homeScreenPage: (context) => HomeScreenPage(),
    captureScreen: (context) => CaptureScreen(),
    userLogsScreen: (context) => UserLogsScreen(),
    learningScreen: (context) => LearningScreen(),
    settingsScreen: (context) => SettingsScreen(),
    profileScreen: (context) => ProfileScreen(),
    editProfileScreen: (context) => EditProfileScreen(userData: {},),
    appNavigationScreen: (context) => AppNavigationScreen(),
    signUpScreen: (context) => SignUpScreen(),
  };
}
