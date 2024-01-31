import 'package:flutter/material.dart';
import 'package:sign_recog/core/app_export.dart';
import 'package:sign_recog/widgets/custom_text_form_field.dart';

class LearningScreen extends StatelessWidget {
  LearningScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController promptController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: 771.v,
          width: 360.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgMaterialSymbol,
                height: 24.adaptSize,
                width: 24.adaptSize,
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(
                  right: 127.h,
                  bottom: 344.v,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder54,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 54.v),
                      _buildLearningScreenTwo(context),
                      SizedBox(height: 54.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 9.h),
                        child: CustomTextFormField(
                          controller: promptController,
                          hintText: "Enter a  phrase",
                          textInputAction: TextInputAction.done,
                          prefix: Container(
                            margin: EdgeInsets.fromLTRB(16.h, 28.v, 12.h, 28.v),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgContrast,
                              height: 24.adaptSize,
                              width: 24.adaptSize,
                            ),
                          ),
                          prefixConstraints: BoxConstraints(
                            maxHeight: 80.v,
                          ),
                          contentPadding: EdgeInsets.only(
                            top: 27.v,
                            right: 12.h,
                            bottom: 27.v,
                          ),
                          borderDecoration:
                              TextFormFieldStyleHelper.outlineBlack,
                          fillColor: theme.colorScheme.onPrimaryContainer,
                        ),
                      ),
                      SizedBox(height: 33.v),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.h,
                          vertical: 29.v,
                        ),
                        decoration: AppDecoration.outlineBlack9001.copyWith(
                          borderRadius: BorderRadiusStyle.customBorderTL341,
                        ),
                        child: Container(
                          width: 343.h,
                          margin: EdgeInsets.only(left: 5.h),
                          padding: EdgeInsets.symmetric(
                            horizontal: 57.h,
                            vertical: 80.v,
                          ),
                          decoration:
                              AppDecoration.fillOnPrimaryContainer.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder34,
                          ),
                          child: Text(
                            "Sign Image",
                            style: CustomTextStyles.headlineLargeInterBlack900,
                          ),
                        ),
                      ),
                    ],
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
  Widget _buildLearningScreenTwo(BuildContext context) {
    return SizedBox(
      height: 101.v,
      width: 348.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgRectangle24,
            height: 101.v,
            width: 348.h,
            radius: BorderRadius.circular(
              30.h,
            ),
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 19.v),
              decoration: AppDecoration.outlineBlack900,
              child: Text(
                "Lets start learning",
                style: theme.textTheme.headlineSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
