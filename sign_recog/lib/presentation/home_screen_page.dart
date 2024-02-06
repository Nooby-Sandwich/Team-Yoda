import 'package:flutter/material.dart';
import 'package:sign_recog/core/app_export.dart';
import 'package:sign_recog/presentation/capture_screen.dart';
import 'package:sign_recog/presentation/learning_screen.dart';
import 'package:sign_recog/presentation/settings_screen.dart';
import 'package:sign_recog/presentation/user_logs_screen.dart';
import 'package:sign_recog/presentation/profile_screen.dart'; // Import the ProfileScreen

class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 44.h, vertical: 44.v),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()), // Navigate to ProfileScreen
                );
              },
              child: _buildButton(context, "My Profile", ImageConstant.imgRectangle22),
            ),
            SizedBox(height: 41.v),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CaptureScreen()),
                );
              },
              child: _buildButton(context, "Capture Signs", ImageConstant.imgRectangle23),
            ),
            SizedBox(height: 51.v),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LearningScreen()),
                );
              },
              child: _buildButton(context, "Start Learning", ImageConstant.imgRectangle24),
            ),
            SizedBox(height: 63.v),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserLogsScreen()),
                );
              },
              child: _buildButton(context, "View Logs", ImageConstant.imgRectangle23),
            ),
            SizedBox(height: 63.v),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
              child: _buildButton(context, "Settings", ImageConstant.imgRectangle24),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, String image) {
    return Container(
      height: 101.v,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(30.h),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: theme.textTheme.headlineLarge!.copyWith(
          color: theme.colorScheme.onPrimaryContainer,
        ),
      ),
    );
  }
}
