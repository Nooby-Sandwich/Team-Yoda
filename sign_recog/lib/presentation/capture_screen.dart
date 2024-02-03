import 'package:flutter/material.dart';
import 'package:sign_recog/core/app_export.dart';

class CaptureScreen extends StatelessWidget {
  const CaptureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: 442.h,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 26.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 590.v,
                          width: 360.h,
                          child: Stack(
                            alignment: Alignment.topLeft,
                            children: [
                              // Add camera widget here
                              CustomCameraWidget(), // Implement CustomCameraWidget separately
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 41.h,
                                    right: 34.h,
                                    bottom: 20.v,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // Add translated text here
                                      Text(
                                        "Translated Text: Some translated text here",
                                        style: CustomTextStyles.headlineLargeInterBlack900,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 124.v),
                        _buildNotificationColumn(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildNotificationColumn(BuildContext context) {
    return Container(
      width: 360.h,
      margin: EdgeInsets.only(right: 30.h),
      padding: EdgeInsets.symmetric(
        horizontal: 144.h,
        vertical: 9.v,
      ),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL34,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 2.v),
          CustomImageView(
            imagePath: ImageConstant.imgVector,
            height: 64.v,
            width: 65.h,
          ),
        ],
      ),
    );
  }
}

// Implement CustomCameraWidget separately
class CustomCameraWidget extends StatelessWidget {
  const CustomCameraWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Implement the camera widget here
    // Example camera widget implementation using Camera package:
    // return CameraPreview(cameraController);
    return Container(
      color: Colors.grey, // Placeholder color
    );
  }
}
