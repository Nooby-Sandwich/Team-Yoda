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
              SizedBox(height: 59.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 29.v),
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
                              CustomImageView(
                                imagePath: ImageConstant.imgSettings,
                                height: 11.v,
                                width: 51.h,
                                alignment: Alignment.topRight,
                                margin: EdgeInsets.only(top: 21.v),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 25.h,
                                    top: 19.v,
                                  ),
                                  child: Text(
                                    "9:41",
                                    style: CustomTextStyles.bodyMediumPoppinsBlack900,
                                  ),
                                ),
                              ),
                              // Add camera widget here
                              // For example: CustomCameraWidget(),
                              // You need to implement CustomCameraWidget separately
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 41.h,
                                    right: 34.h,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // Add translated text here
                                      SizedBox(height: 20.v),
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
