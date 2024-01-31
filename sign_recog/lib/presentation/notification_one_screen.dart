import 'package:flutter/material.dart';
import 'package:sign_recog/core/app_export.dart';
import 'package:sign_recog/widgets/custom_switch.dart';

class NotificationOneScreen extends StatelessWidget {
  NotificationOneScreen({Key? key})
      : super(
          key: key,
        );

  bool isSelectedSwitch = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 3.h,
            vertical: 10.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 5.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgSearch,
                      height: 33.v,
                      width: 40.h,
                      margin: EdgeInsets.only(bottom: 5.v),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 8.h,
                        top: 5.v,
                      ),
                      child: Text(
                        "Settings",
                        style: theme.textTheme.headlineMedium,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 61.v),
              _buildSeventyOneStack(context),
              SizedBox(height: 21.v),
              Padding(
                padding: EdgeInsets.only(left: 30.h),
                child: Text(
                  "Account Settings",
                  style: CustomTextStyles.bodyLargeGray500,
                ),
              ),
              SizedBox(height: 22.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 30.h,
                  right: 58.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 4.v),
                      child: Text(
                        "Change Font Size",
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                    Column(
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgVectorGray800,
                          height: 9.v,
                          width: 10.h,
                        ),
                        SizedBox(height: 6.v),
                        CustomImageView(
                          imagePath: ImageConstant.imgVectorGray8009x10,
                          height: 9.v,
                          width: 10.h,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 19.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 30.h,
                  right: 58.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Change Language",
                      style: theme.textTheme.bodyLarge,
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgVectorGray80010x9,
                      height: 10.v,
                      width: 9.h,
                      margin: EdgeInsets.only(
                        top: 2.v,
                        bottom: 9.v,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 14.v),
              _buildTwentySevenRow(context),
              SizedBox(height: 33.v),
              CustomImageView(
                imagePath: ImageConstant.imgInbox,
                height: 18.v,
                width: 22.h,
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(right: 29.h),
              ),
              SizedBox(height: 74.v),
              Divider(
                color: appTheme.gray400,
                indent: 5.h,
              ),
              SizedBox(height: 19.v),
              Padding(
                padding: EdgeInsets.only(left: 30.h),
                child: Text(
                  "More",
                  style: CustomTextStyles.bodyLargeGray500,
                ),
              ),
              SizedBox(height: 22.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 30.h,
                  right: 25.h,
                ),
                child: _buildTwentyFourRow(
                  context,
                  privacyPolicyText: "About us",
                ),
              ),
              SizedBox(height: 24.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 30.h,
                  right: 25.h,
                ),
                child: _buildTwentyFourRow(
                  context,
                  privacyPolicyText: "Privacy policy",
                ),
              ),
              SizedBox(height: 23.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 30.h,
                  right: 25.h,
                ),
                child: _buildTwentyFourRow(
                  context,
                  privacyPolicyText: "Terms and conditions",
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSeventyOneStack(BuildContext context) {
    return Container(
      height: 33.v,
      width: 379.h,
      margin: EdgeInsets.only(left: 5.h),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 25.h),
              child: Row(
                children: [
                  Container(
                    height: 33.v,
                    width: 40.h,
                    decoration: AppDecoration.outlineIndigoF,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgImage4,
                          height: 33.v,
                          width: 40.h,
                          radius: BorderRadius.circular(
                            20.h,
                          ),
                          alignment: Alignment.center,
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgImage5,
                          height: 33.v,
                          width: 40.h,
                          radius: BorderRadius.circular(
                            20.h,
                          ),
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 12.h,
                      top: 7.v,
                      bottom: 3.v,
                    ),
                    child: Text(
                      "Yennefer Doe",
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: 379.h,
              child: Divider(
                color: appTheme.gray400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTwentySevenRow(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(
          left: 30.h,
          right: 24.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 3.v),
              child: Text(
                "Dark mode",
                style: theme.textTheme.bodyLarge,
              ),
            ),
            CustomSwitch(
              value: isSelectedSwitch,
              onChange: (value) {
                isSelectedSwitch = value;
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Common widget
  Widget _buildTwentyFourRow(
    BuildContext context, {
    required String privacyPolicyText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 1.v),
          child: Text(
            privacyPolicyText,
            style: theme.textTheme.bodyLarge!.copyWith(
              color: appTheme.black900,
            ),
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgVectorGray80010x9,
          height: 20.v,
          width: 24.h,
          margin: EdgeInsets.only(bottom: 3.v),
        ),
      ],
    );
  }
}
