import 'package:flutter/material.dart';
import 'package:sign_recog/core/app_export.dart';
import 'package:sign_recog/widgets/custom_elevated_button.dart';
import 'package:sign_recog/widgets/custom_icon_button.dart';

class UserLogsScreen extends StatelessWidget {
  const UserLogsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: 442.h,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 34.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10.v),
                    padding: EdgeInsets.symmetric(vertical: 19.v),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 97.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "9:41",
                                textAlign: TextAlign.center,
                                style:
                                    CustomTextStyles.bodyMediumPoppinsBlack900,
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgSettings,
                                height: 11.v,
                                width: 66.h,
                                margin: EdgeInsets.only(bottom: 7.v),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 21.v),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 10.h,
                            right: 120.h,
                          ),
                          child: Row(
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgArrowDown,
                                height: 24.adaptSize,
                                width: 24.adaptSize,
                                margin: EdgeInsets.only(bottom: 2.v),
                              ),
                              Spacer(
                                flex: 58,
                              ),
                              Text(
                                "Logs",
                                style:
                                    CustomTextStyles.titleLargePrimaryContainer,
                              ),
                              Spacer(
                                flex: 41,
                              ),
                              CustomElevatedButton(
                                height: 25.v,
                                width: 57.h,
                                text: "1 New",
                                buttonStyle: CustomButtonStyles.fillBlueGray,
                                buttonTextStyle: CustomTextStyles
                                    .titleSmallOnPrimaryContainerSemiBold,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 36.v),
                        Container(
                          margin: EdgeInsets.only(right: 97.h),
                          padding: EdgeInsets.symmetric(horizontal: 10.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 13.h),
                                child: _buildDateSection(
                                  context,
                                  yesterdayText: "Today",
                                  markAllAsReadText: "Mark all as read",
                                ),
                              ),
                              SizedBox(height: 25.v),
                              Padding(
                                padding: EdgeInsets.only(right: 12.h),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomIconButton(
                                      height: 60.adaptSize,
                                      width: 60.adaptSize,
                                      padding: EdgeInsets.all(18.h),
                                      child: CustomImageView(
                                        imagePath:
                                            ImageConstant.imgCalendarTeal900,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 16.h,
                                        top: 9.v,
                                        bottom: 5.v,
                                      ),
                                      child: _buildNotificationSection(
                                        context,
                                        translatedText:
                                            "Successfully Translated",
                                        greetingText:
                                            "May I please borrow a pen",
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 32.h,
                                        top: 7.v,
                                        bottom: 35.v,
                                      ),
                                      child: Text(
                                        "1h",
                                        style: theme.textTheme.bodyMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 42.v),
                              Padding(
                                padding: EdgeInsets.only(right: 13.h),
                                child: _buildDateSection(
                                  context,
                                  yesterdayText: "YESTERDAY",
                                  markAllAsReadText: "Mark all as read",
                                ),
                              ),
                              SizedBox(height: 25.v),
                              Padding(
                                padding: EdgeInsets.only(right: 13.h),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomIconButton(
                                      height: 60.adaptSize,
                                      width: 60.adaptSize,
                                      padding: EdgeInsets.all(18.h),
                                      child: CustomImageView(
                                        imagePath:
                                            ImageConstant.imgCalendarTeal900,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 16.h,
                                        top: 9.v,
                                        bottom: 5.v,
                                      ),
                                      child: _buildNotificationSection(
                                        context,
                                        translatedText:
                                            "Successfully Translated",
                                        greetingText: "Hello! Nice to meet you",
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 31.h,
                                        top: 7.v,
                                        bottom: 35.v,
                                      ),
                                      child: Text(
                                        "1d",
                                        style: theme.textTheme.bodyMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 36.v),
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

  /// Common widget
  Widget _buildDateSection(
    BuildContext context, {
    required String yesterdayText,
    required String markAllAsReadText,
  }) {
    return Row(
      children: [
        Text(
          yesterdayText,
          style: CustomTextStyles.bodyLargeInterGray600.copyWith(
            color: appTheme.gray600,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 112.h,
            bottom: 2.v,
          ),
          child: Text(
            markAllAsReadText,
            style: theme.textTheme.titleSmall!.copyWith(
              color: theme.colorScheme.onSecondaryContainer,
            ),
          ),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildNotificationSection(
    BuildContext context, {
    required String translatedText,
    required String greetingText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          translatedText,
          style: theme.textTheme.titleMedium!.copyWith(
            color: theme.colorScheme.onSecondaryContainer,
          ),
        ),
        SizedBox(height: 8.v),
        Text(
          greetingText,
          style: theme.textTheme.bodyMedium!.copyWith(
            color: appTheme.gray600,
          ),
        ),
      ],
    );
  }
}
