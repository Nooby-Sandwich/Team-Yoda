import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_recog/core/app_export.dart';
import 'package:sign_recog/widgets/app_bar/appbar_title.dart';
import 'package:sign_recog/widgets/app_bar/custom_app_bar.dart';
import 'package:sign_recog/presentation/edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      // User is not authenticated, handle accordingly
      return Center(child: Text('User is not authenticated'));
    }

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance.collection('users').doc(userId).get(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData || snapshot.data == null || snapshot.data!.data() == null) {
              print('No user data found for user ID: $userId');
              return Center(child: Text('No user data found'));
            }
            var userData = snapshot.data!.data()! as Map<String, dynamic>;
            print('User data found: $userData');
            return SingleChildScrollView(
              child: Column(
                children: [
                  _buildEditPicInfo(context, userData),
                  SizedBox(height: 5.v),
                  _buildMenu(context),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitle(
        text: "Profile",
      ),
    );
  }

  Widget _buildEditPicInfo(BuildContext context, Map<String, dynamic> userData) {
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
          _buildInfoRow('Name', "${userData['firstName']} ${userData['lastName']}"),
          _buildInfoRow('Phone', userData['phone']),
          _buildInfoRow('Email', userData['email']),
          _buildInfoRow('Age', userData['age']?.toString() ?? ''),
          _buildInfoRow('Gender', userData['gender'] ?? ''),
          _buildInfoRow('Disability', userData['disability'] ?? ''),
          SizedBox(height: 24.v),
          ElevatedButton(
            onPressed: () {
              // Navigate to edit profile screen
              Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileScreen(userData: userData)));
            },
            child: Text('Edit Profile'),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.v),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildMenu(BuildContext context) {
    // Build your menu widgets here
    // This part remains the same as before
    return Container(); // Placeholder return for now
  }
}
