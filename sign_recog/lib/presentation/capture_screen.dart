import 'package:flutter/material.dart';
import 'package:sign_recog/core/app_export.dart';

class CaptureScreen extends StatelessWidget {
  const CaptureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _buildCameraView(context),
          _buildControls(context),
        ],
      ),
    );
  }

  Widget _buildCameraView(BuildContext context) {
    // Implement camera view widget here
    return Container(
      // Your camera view implementation
    );
  }

  Widget _buildControls(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.v, horizontal: 40.h),
        color: Colors.black.withOpacity(0.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                // Handle recording button tap
              },
              icon: Icon(Icons.videocam, color: Colors.white, size: 32),
            ),
            IconButton(
              onPressed: () {
                // Handle other controls if needed
              },
              icon: Icon(Icons.flash_on, color: Colors.white, size: 32),
            ),
            IconButton(
              onPressed: () {
                // Handle other controls if needed
              },
              icon: Icon(Icons.switch_camera, color: Colors.white, size: 32),
            ),
          ],
        ),
      ),
    );
  }
}
