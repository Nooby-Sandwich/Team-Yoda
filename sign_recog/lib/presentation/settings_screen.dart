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
          routes: {
            AppRoutes.signInScreen: (context) => SignInScreen(),
            AppRoutes.settingsScreen: (context) => SettingsScreen(),
            // Add other routes here if needed
          },
        );
      },
    );
  }
}

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkMode = false;
  double _fontSize = 16.0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = _isDarkMode ? ThemeData.dark() : ThemeData.light();

    return Builder(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Settings'),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Text Size',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Slider(
                  value: _fontSize,
                  min: 12,
                  max: 24,
                  onChanged: (value) {
                    setState(() {
                      _fontSize = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                Text(
                  'Dark Mode',
                  style: Theme.of(context).textTheme.headline6,
                ),
                CustomSwitch(
                  value: _isDarkMode,
                  onChange: (value) {
                    setState(() {
                      _isDarkMode = value;
                      ThemeHelper().changeTheme(value ? 'dark' : 'light');
                    });
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
