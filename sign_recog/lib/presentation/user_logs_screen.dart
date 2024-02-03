import 'package:flutter/material.dart';
import 'package:sign_recog/core/app_export.dart';
import 'package:sign_recog/models/log.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sign_recog/widgets/custom_elevated_button.dart';
import 'package:sign_recog/widgets/custom_icon_button.dart';

class UserLogsScreen extends StatelessWidget {
  const UserLogsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Log>>(
      future: getLogs(), // Call the function to retrieve logs
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While waiting for the data, show a loading indicator
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // If there's an error, display an error message
          return Text('Error: ${snapshot.error}');
        } else {
          // If data is successfully retrieved, display the logs
          List<Log>? logs = snapshot.data;
          if (logs != null && logs.isNotEmpty) {
            return Scaffold(
              body: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 34.v),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 21.v),
                              Row(
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
                                    style: CustomTextStyles.titleLargePrimaryContainer,
                                  ),
                                  Spacer(
                                    flex: 41,
                                  ),
                                  CustomElevatedButton(
                                    height: 25.v,
                                    width: 57.h,
                                    text: "1 New",
                                    buttonStyle: CustomButtonStyles.fillBlueGray,
                                    buttonTextStyle: CustomTextStyles.titleSmallOnPrimaryContainerSemiBold,
                                  ),
                                ],
                              ),
                              SizedBox(height: 36.v),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: logs.length,
                                itemBuilder: (context, index) {
                                  Log log = logs[index];
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 36.v),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomIconButton(
                                          height: 60.adaptSize,
                                          width: 60.adaptSize,
                                          padding: EdgeInsets.all(18.h),
                                          child: CustomImageView(
                                            imagePath: ImageConstant.imgCalendarTeal900,
                                          ),
                                        ),
                                        SizedBox(width: 16.h),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                log.translatedText,
                                                style: theme.textTheme.titleMedium!.copyWith(
                                                  color: theme.colorScheme.onSecondaryContainer,
                                                ),
                                              ),
                                              SizedBox(height: 8.v),
                                              Text(
                                                log.greetingText,
                                                style: theme.textTheme.bodyMedium!.copyWith(
                                                  color: appTheme.gray600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          log.duration,
                                          style: theme.textTheme.bodyMedium,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            // If there are no logs, display a message indicating that
            return Center(
              child: Text('No logs available.'),
            );
          }
        }
      },
    );
  }

  // Function to get logs
  Future<List<Log>> getLogs() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      QuerySnapshot querySnapshot = await firestore.collection('logs').get();
      List<Log> logs = querySnapshot.docs.map((doc) {
        return Log(
          translatedText: doc['translatedText'],
          greetingText: doc['greetingText'],
          duration: doc['timestamp'].toString(),
        );
      }).toList();
      return logs;
    } catch (e) {
      print('Error getting logs: $e');
      return []; // Return an empty list in case of error
    }
  }
}

