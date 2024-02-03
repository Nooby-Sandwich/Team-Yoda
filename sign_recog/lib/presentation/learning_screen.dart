import 'package:flutter/material.dart';
import 'package:sign_recog/core/app_export.dart';
import 'package:sign_recog/models/log.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sign_recog/widgets/custom_icon_button.dart';

class LearningScreen extends StatefulWidget {
  const LearningScreen({Key? key}) : super(key: key);

  @override
  _LearningScreenState createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen> {
  TextEditingController promptController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
   List<Log> logs = []; // Declare the logs variable
  @override
  void initState() {
      super.initState();
      getLogs().then((fetchedLogs) {
        setState(() {
          logs = fetchedLogs; // Populate the logs variable with fetched data
        });
      });
  }
  // Function to create a log entry
  Future<void> createLog(String translatedText, String greetingText) async {
    try {
      await _firestore.collection('logs').add({
        'translatedText': translatedText,
        'greetingText': greetingText,
        'timestamp': DateTime.now(),
      });
      print('Log created successfully');
    } catch (e) {
      print('Error creating log: $e');
    }
  }

  // Function to get logs
  Future<List<Log>> getLogs() async {
    List<Log> logs = [];
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('logs').get();
      querySnapshot.docs.forEach((doc) {
        logs.add(Log(
          translatedText: doc['translatedText'],
          greetingText: doc['greetingText'],
          duration: doc['timestamp'].toString(),
        ));
      });
      return logs;
    } catch (e) {
      print('Error getting logs: $e');
      return [];
    }
  }


  @override
  Widget build(BuildContext context) {
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
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
  }
}
