import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sign_recog/core/app_export.dart';
import 'package:sign_recog/presentation/home_screen_container_screen.dart';
import 'package:sign_recog/widgets/custom_elevated_button.dart';
import 'package:sign_recog/widgets/custom_text_form_field.dart';
import 'package:sign_recog/auth_service.dart'; 
class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  String? gender;
  String? disability;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _signUp(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Store user data in Firestore
      await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
        'firstName': firstNameController.text,
        'lastName': lastNameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
        'age': ageController.text,
        'gender': gender,
        'disability': disability,
      });

      // Redirect to HomeScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreenContainerScreen()),
      );
    } catch (e) {
      // Handle signUp errors
      print('Failed to sign up: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
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
                        "Sign Up",
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    SizedBox(height: 33.v),
                    _buildFormField(" First Name", firstNameController),
                    SizedBox(height: 20.v),
                    _buildFormField(" Last Name", lastNameController),
                    SizedBox(height: 20.v),
                    _buildFormField(" Email", emailController),
                    SizedBox(height: 20.v),
                    _buildFormField(" Password", passwordController, obscureText: true),
                    SizedBox(height: 20.v),
                    _buildFormField(" Phone Number", phoneController),
                    SizedBox(height: 20.v),
                    _buildDropDown(" Gender", ["Male", "Female"], (value) => gender = value),
                    SizedBox(height: 20.v),
                    _buildFormField(" Age", ageController),
                    SizedBox(height: 20.v),
                    _buildDropDown(" Disability", ["None", "Mute", "Other" ], (value) => disability = value),
                    SizedBox(height: 26.v),

                    // Inside the build method, add the following button
                    CustomElevatedButton(
                     height: 48.v,
                     text: "Sign Up with Google",
                     margin: EdgeInsets.only(
                        left: 24.h,
                        right: 35.h,
                     ),
                     onPressed: () async {
                        User? user = await AuthService().signInWithGoogle();
                        if (user != null) {
                          // Perform actions after successful sign-up
                        } else {
                          // Handle sign-up failure
                        }
                     },
                    ),
                    _buildSignIn(context),
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

  Widget _buildFormField(String label, TextEditingController controller, {bool obscureText = false}) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24.h,
        right: 35.h,
      ),
      child: CustomTextFormField(
        controller: controller,
        hintText: label,
        textInputType: TextInputType.text,
        obscureText: obscureText,
        prefixConstraints: BoxConstraints(maxHeight: 45.v),
      ),
    );
  }

  Widget _buildDropDown(String label, List<String> options, Function(String?) onChanged) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24.h,
        right: 35.h,
      ),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          hintText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
        items: options.map((option) => DropdownMenuItem(value: option, child: Text(option))).toList(),
        onChanged: onChanged as void Function(String?)?,
      ),
    );
  }

  Widget _buildSignIn(BuildContext context) {
    return CustomElevatedButton(
      height: 48.v,
      text: "Sign Up",
      margin: EdgeInsets.only(
        left: 24.h,
        right: 35.h,
      ),
      onPressed: () => _signUp(context),
    );
  }
}
