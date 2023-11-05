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
    apiKey: 'AIzaSyAhRTb_ZFbg-2GQ1pTv1HtQVhvfd8CRLts',
    appId: '1:619301210836:web:8e8c407b369a01a4904941',
    messagingSenderId: '619301210836',
    projectId: 'socleader-d2df8',
    authDomain: 'socleader-d2df8.firebaseapp.com',
    storageBucket: 'socleader-d2df8.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBsc5kAbHt6icKq4clbT0qIYuWDqUZcz3Y',
    appId: '1:619301210836:android:c29d1c22e166bcb5904941',
    messagingSenderId: '619301210836',
    projectId: 'socleader-d2df8',
    storageBucket: 'socleader-d2df8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDMNultWIcSLVoQaZgjHYxI9AG41yww888',
    appId: '1:619301210836:ios:67395c13b7b41aa2904941',
    messagingSenderId: '619301210836',
    projectId: 'socleader-d2df8',
    storageBucket: 'socleader-d2df8.appspot.com',
    iosBundleId: 'com.example.socLeader',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDMNultWIcSLVoQaZgjHYxI9AG41yww888',
    appId: '1:619301210836:ios:f3f704e9732db598904941',
    messagingSenderId: '619301210836',
    projectId: 'socleader-d2df8',
    storageBucket: 'socleader-d2df8.appspot.com',
    iosBundleId: 'com.example.socLeader.RunnerTests',
  );
}
