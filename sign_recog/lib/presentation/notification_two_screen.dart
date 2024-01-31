import 'package:flutter/material.dart';
import 'package:sign_recog/core/app_export.dart';
import 'package:sign_recog/widgets/app_bar/appbar_title.dart';
import 'package:sign_recog/widgets/app_bar/custom_app_bar.dart';

class NotificationTwoScreen extends StatelessWidget {
  const NotificationTwoScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildEditPicInfo(context),
              SizedBox(height: 5.v),
              _buildMenu(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitle(
        text: "Profile",
      ),
    );
  }

  /// Section Widget
  Widget _buildEditPicInfo(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 110.h,
        vertical: 17.v,
      ),
      decoration: AppDecoration.fillOnPrimaryContainer,
      child: Column(
        children: [
          SizedBox(height: 15.v),
          SizedBox(
            height: 168.adaptSize,
            width: 168.adaptSize,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgVector168x168,
                  height: 168.adaptSize,
                  width: 168.adaptSize,
                  radius: BorderRadius.circular(
                    84.h,
                  ),
                  alignment: Alignment.center,
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgUserOnsecondarycontainer,
                  height: 34.adaptSize,
                  width: 34.adaptSize,
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.only(
                    right: 7.h,
                    bottom: 10.v,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 18.v),
          Text(
            "Daniel Martinez",
            style: CustomTextStyles.titleMediumOnPrimary,
          ),
          SizedBox(height: 8.v),
          Text(
            "+123 856479683",
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildMenu(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      decoration: AppDecoration.fillOnPrimaryContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 1.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: IntrinsicWidth(
                      child: _buildLogs(
                        context,
                        favoriteImage: ImageConstant.imgVuesaxLinearUserEdit,
                        logs: "Edit Profile",
                      ),
                    ),
                  ),
                  SizedBox(height: 13.v),
                  Divider(),
                ],
              ),
              CustomImageView(
                imagePath: ImageConstant.imgArrowRight,
                height: 14.adaptSize,
                width: 14.adaptSize,
                margin: EdgeInsets.symmetric(vertical: 5.v),
              ),
            ],
          ),
          SizedBox(height: 13.v),
          Divider(),
          SizedBox(height: 12.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: IntrinsicWidth(
                      child: _buildLogs(
                        context,
                        favoriteImage: ImageConstant.imgFavorite,
                        logs: "Logs",
                      ),
                    ),
                  ),
                  SizedBox(height: 12.v),
                  Divider(),
                ],
              ),
              CustomImageView(
                imagePath: ImageConstant.imgArrowRight,
                height: 14.adaptSize,
                width: 14.adaptSize,
                margin: EdgeInsets.symmetric(vertical: 5.v),
              ),
            ],
          ),
          SizedBox(height: 12.v),
          Divider(),
          SizedBox(height: 12.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: IntrinsicWidth(
                      child: _buildLogs(
                        context,
                        favoriteImage:
                            ImageConstant.imgVuesaxLinearNotification,
                        logs: "Notifications",
                      ),
                    ),
                  ),
                  SizedBox(height: 13.v),
                  Divider(),
                ],
              ),
              CustomImageView(
                imagePath: ImageConstant.imgArrowRight,
                height: 14.adaptSize,
                width: 14.adaptSize,
                margin: EdgeInsets.symmetric(vertical: 5.v),
              ),
            ],
          ),
          SizedBox(height: 13.v),
          Divider(),
          SizedBox(height: 11.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: IntrinsicWidth(
                      child: _buildLogs(
                        context,
                        favoriteImage:
                            ImageConstant.imgSearchOnsecondarycontainer,
                        logs: "Settings",
                      ),
                    ),
                  ),
                  SizedBox(height: 12.v),
                  Divider(),
                ],
              ),
              CustomImageView(
                imagePath: ImageConstant.imgArrowRight,
                height: 14.adaptSize,
                width: 14.adaptSize,
                margin: EdgeInsets.only(
                  top: 6.v,
                  bottom: 5.v,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.v),
          Divider(),
          SizedBox(height: 12.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: IntrinsicWidth(
                      child: _buildLogs(
                        context,
                        favoriteImage: ImageConstant.imgProfile,
                        logs: "Help and Support",
                      ),
                    ),
                  ),
                  SizedBox(height: 12.v),
                  Divider(),
                ],
              ),
              CustomImageView(
                imagePath: ImageConstant.imgArrowRight,
                height: 14.adaptSize,
                width: 14.adaptSize,
                margin: EdgeInsets.symmetric(vertical: 5.v),
              ),
            ],
          ),
          SizedBox(height: 12.v),
          Divider(),
          SizedBox(height: 12.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: IntrinsicWidth(
                      child: _buildLogs(
                        context,
                        favoriteImage:
                            ImageConstant.imgSettingsOnsecondarycontainer,
                        logs: "Terms and Conditions",
                      ),
                    ),
                  ),
                  SizedBox(height: 13.v),
                  Divider(),
                ],
              ),
              CustomImageView(
                imagePath: ImageConstant.imgArrowRight,
                height: 14.adaptSize,
                width: 14.adaptSize,
                margin: EdgeInsets.symmetric(vertical: 5.v),
              ),
            ],
          ),
          SizedBox(height: 13.v),
          Divider(),
          SizedBox(height: 12.v),
          Row(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgClock,
                height: 24.adaptSize,
                width: 24.adaptSize,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 16.h,
                  top: 2.v,
                ),
                child: Text(
                  "Log Out",
                  style: CustomTextStyles.bodyLargeInterGray600_1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildLogs(
    BuildContext context, {
    required String favoriteImage,
    required String logs,
  }) {
    return SizedBox(
      width: 342.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: favoriteImage,
            height: 24.adaptSize,
            width: 24.adaptSize,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.h,
              top: 2.v,
            ),
            child: Text(
              logs,
              style: CustomTextStyles.bodyLargeInterGray600_1.copyWith(
                color: appTheme.gray600,
              ),
            ),
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgArrowRight,
            height: 14.adaptSize,
            width: 14.adaptSize,
            margin: EdgeInsets.symmetric(vertical: 5.v),
          ),
        ],
      ),
    );
  }
}
