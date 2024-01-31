// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA7Th73Z7HlQf0Ch_SA-1mx69C1M0smcks',
    appId: '1:650264255478:web:79da805b9078266792c5d7',
    messagingSenderId: '650264255478',
    projectId: 'signsense-7b4ee',
    authDomain: 'signsense-7b4ee.firebaseapp.com',
    storageBucket: 'signsense-7b4ee.appspot.com',
    measurementId: 'G-RZZ2377PLE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA8XAtp2K-F1zeVTerasbIO8EpbQtooYnY',
    appId: '1:650264255478:android:263c7605724ec12c92c5d7',
    messagingSenderId: '650264255478',
    projectId: 'signsense-7b4ee',
    storageBucket: 'signsense-7b4ee.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBSTagAETnzBctZ39zdf-Sgvm4r4MDDwK0',
    appId: '1:650264255478:ios:874eb37735e34ff492c5d7',
    messagingSenderId: '650264255478',
    projectId: 'signsense-7b4ee',
    storageBucket: 'signsense-7b4ee.appspot.com',
    iosBundleId: 'com.signrecog.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBSTagAETnzBctZ39zdf-Sgvm4r4MDDwK0',
    appId: '1:650264255478:ios:dbe6b4b4e967d00692c5d7',
    messagingSenderId: '650264255478',
    projectId: 'signsense-7b4ee',
    storageBucket: 'signsense-7b4ee.appspot.com',
    iosBundleId: 'com.example.signRecog.RunnerTests',
  );
}
