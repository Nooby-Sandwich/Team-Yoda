import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_recog/core/app_export.dart';
import 'package:sign_recog/presentation/home_screen_container_screen.dart';
import 'package:sign_recog/presentation/sign_up_screen.dart';
import 'package:sign_recog/widgets/custom_elevated_button.dart';
import 'package:sign_recog/widgets/custom_outlined_button.dart';
import 'package:sign_recog/widgets/custom_text_form_field.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _signInWithEmailAndPassword(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // Navigate to homepage after successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreenContainerScreen()),
      );
    } catch (e) {
      // Handle authentication errors
      print('Failed to sign in: $e');
      // You can show error messages to the user here
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: SizedBox(
            width: 360.h,
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(left: 4.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusStyle.roundedBorder54,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgSignsenseHigh,
                      height: 186.v,
                      width: 345.h,
                    ),
                    SizedBox(height: 35.v),
                    Padding(
                      padding: EdgeInsets.only(left: 83.h),
                      child: Text(
                        "Hi, Welcome Back! ",
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    SizedBox(height: 33.v),
                    _buildEmail(context),
                    SizedBox(height: 20.v),
                    _buildPassword(context),
                    SizedBox(height: 23.v),
                    _buildSignIn(context),
                    SizedBox(height: 26.v),
                    _buildSeparator(context),
                    SizedBox(height: 23.v),
                    _buildSignInWithGoogle(context),
                    SizedBox(height: 16.v),
                    _buildSignInWithFacebook(context),
                    SizedBox(height: 26.v),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Forgot password?",
                        style: CustomTextStyles.titleSmallBlueA700,
                      ),
                    ),
                    SizedBox(height: 26.v),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          // Redirect to SignUpScreen
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUpScreen()),
                          );
                        },
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Don’t have an account yet?",
                                style: CustomTextStyles.bodyMediumff6b7280,
                              ),
                              TextSpan(
                                text: " ",
                              ),
                              TextSpan(
                                text: "Sign up",
                                style: CustomTextStyles.titleSmallff1c64f2,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    SizedBox(height: 26.v),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Email TextFormField
  Widget _buildEmail(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24.h,
        right: 35.h,
      ),
      child: CustomTextFormField(
        controller: emailController,
        hintText: "Your Email",
        textInputType: TextInputType.emailAddress,
        prefix: Container(
          margin: EdgeInsets.fromLTRB(16.h, 13.v, 8.h, 13.v),
          child: CustomImageView(
            imagePath: ImageConstant.imgCheckmark,
            height: 18.adaptSize,
            width: 18.adaptSize,
          ),
        ),
        prefixConstraints: BoxConstraints(
          maxHeight: 45.v,
        ),
      ),
    );
  }

  // Password TextFormField
  Widget _buildPassword(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24.h,
        right: 35.h,
      ),
      child: CustomTextFormField(
        controller: passwordController,
        hintText: "Password",
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        prefix: Container(
          margin: EdgeInsets.fromLTRB(16.h, 13.v, 8.h, 13.v),
          child: CustomImageView(
            imagePath: ImageConstant.imgLocation,
            height: 18.adaptSize,
            width: 18.adaptSize,
          ),
        ),
        prefixConstraints: BoxConstraints(
          maxHeight: 45.v,
        ),
        obscureText: true,
      ),
    );
  }

  // Sign In Button
  Widget _buildSignIn(BuildContext context) {
    return CustomElevatedButton(
      height: 48.v,
      text: "Sign In",
      margin: EdgeInsets.only(
        left: 24.h,
        right: 35.h,
      ),
      onPressed: () => _signInWithEmailAndPassword(context),
    );
  }

  // Separator Widget
  Widget _buildSeparator(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24.h,
        right: 35.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 7.v,
              bottom: 11.v,
            ),
            child: SizedBox(
              width: 116.h,
              child: Divider(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 24.h),
            child: Text(
              "or",
              style: CustomTextStyles.titleMediumGray600,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 7.v,
              bottom: 11.v,
            ),
            child: SizedBox(
              width: 140.h,
              child: Divider(
                indent: 24.h,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Sign In with Google Button
  Widget _buildSignInWithGoogle(BuildContext context) {
    return CustomOutlinedButton(
      text: "Sign In with Google",
      margin: EdgeInsets.only(
        left: 24.h,
        right: 35.h,
      ),
      leftIcon: Container(
        margin: EdgeInsets.only(right: 8.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgGoogleOriginal,
          height: 20.adaptSize,
          width: 20.adaptSize,
        ),
      ),
    );
  }

  // Sign In with Facebook Button
  Widget _buildSignInWithFacebook(BuildContext context) {
    return CustomOutlinedButton(
      text: "Sign In with Facebook",
      margin: EdgeInsets.only(
        left: 24.h,
        right: 35.h,
      ),
    );
  }
}
