import 'package:flutter/material.dart';
import 'package:sign_recog/core/app_export.dart';
import 'package:sign_recog/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class NotificationBottomsheet extends StatelessWidget {
  const NotificationBottomsheet({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.h,
      padding: EdgeInsets.symmetric(
        horizontal: 9.h,
        vertical: 24.v,
      ),
      decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.customBorderBL54,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 4.v),
          Text(
            "Logout",
            style: theme.textTheme.titleLarge,
          ),
          SizedBox(height: 16.v),
          Divider(),
          SizedBox(height: 18.v),
          Text(
            "Are you sure you want to log out?",
            style: CustomTextStyles.titleMediumGray600SemiBold,
          ),
          SizedBox(height: 24.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomElevatedButton(
                width: 163.h,
                text: "Cancel",
                buttonStyle: CustomButtonStyles.fillPrimary,
                buttonTextStyle: theme.textTheme.titleSmall!,
              ),
              CustomElevatedButton(
                width: 163.h,
                text: "Yes, Logout",
                margin: EdgeInsets.only(left: 16.h),
                buttonStyle: CustomButtonStyles.fillOnSecondaryContainerTL20,
                buttonTextStyle: CustomTextStyles.titleSmallOnPrimaryContainer,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
