import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sign_recog/presentation/sign_in_screen.dart';

import '../core/utils/size_utils.dart';
import '../firebase_options.dart';
import '../routes/app_routes.dart';
import '../theme/theme_helper.dart';
import '../widgets/custom_switch.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // Initialize Firebase with the appropriate options
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /// Please update theme as per your need if required.
  ThemeHelper().changeTheme('primary');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme,
          title: 'sign_recog',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.signInScreen,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
