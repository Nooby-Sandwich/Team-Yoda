import 'package:flutter/material.dart';
import 'package:sign_recog/core/app_export.dart';
import 'package:sign_recog/presentation/capture_screen.dart';
import 'package:sign_recog/presentation/learning_screen.dart';
import 'package:sign_recog/presentation/settings_screen.dart';
import 'package:sign_recog/presentation/user_logs_screen.dart';
import 'package:sign_recog/presentation/profile_screen.dart';

class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 44.h, vertical: 44.v),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                },
                child: _buildButton(context, "My Profile"),
              ),
              SizedBox(height: 41.v),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CaptureScreen()),
                  );
                },
                child: _buildButton(context, "Capture Signs"),
              ),
              SizedBox(height: 51.v),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LearningScreen()),
                  );
                },
                child: _buildButton(context, "Start Learning"),
              ),
              SizedBox(height: 63.v),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserLogsScreen()),
                  );
                },
                child: _buildButton(context, "View Logs"),
              ),
              SizedBox(height: 63.v),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()),
                  );
                },
                child: _buildButton(context, "Settings"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text) {
    return Container(
      height: 101.v,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(30.h),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
