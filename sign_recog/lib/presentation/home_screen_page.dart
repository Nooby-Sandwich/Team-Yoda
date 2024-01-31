import 'package:flutter/material.dart';
import 'package:sign_recog/core/app_export.dart';
import 'package:sign_recog/presentation/capture_screen.dart';

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
            _buildButton(context, "My Profile", ImageConstant.imgRectangle22),
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
            _buildButton(context, "Start Learning", ImageConstant.imgRectangle24),
            SizedBox(height: 63.v),
            _buildButton(context, "Settings", ImageConstant.imgRectangle25),
            SizedBox(height: 63.v),
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
