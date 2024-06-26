// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBlSoUQtBS9tzOBbcxCDzGYaI0qwFDBgGQ',
    appId: '1:361810829641:web:21069fb301bfba7b727a98',
    messagingSenderId: '361810829641',
    projectId: 'messaging-45236',
    authDomain: 'messaging-45236.firebaseapp.com',
    storageBucket: 'messaging-45236.appspot.com',
    measurementId: 'G-YTH55VSZT4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBuD8esEWHkJnpyc2r2psBWcVgC0MVZ6XE',
    appId: '1:361810829641:android:807195e485c5103a727a98',
    messagingSenderId: '361810829641',
    projectId: 'messaging-45236',
    storageBucket: 'messaging-45236.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDkuT3SN-qERe3vE-BfnFHmLy4tX6FSnFQ',
    appId: '1:361810829641:ios:b1a8935dd7a9304f727a98',
    messagingSenderId: '361810829641',
    projectId: 'messaging-45236',
    storageBucket: 'messaging-45236.appspot.com',
    iosBundleId: 'com.example.messagingApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDkuT3SN-qERe3vE-BfnFHmLy4tX6FSnFQ',
    appId: '1:361810829641:ios:b1a8935dd7a9304f727a98',
    messagingSenderId: '361810829641',
    projectId: 'messaging-45236',
    storageBucket: 'messaging-45236.appspot.com',
    iosBundleId: 'com.example.messagingApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBlSoUQtBS9tzOBbcxCDzGYaI0qwFDBgGQ',
    appId: '1:361810829641:web:cb9bd2cd7c6c774a727a98',
    messagingSenderId: '361810829641',
    projectId: 'messaging-45236',
    authDomain: 'messaging-45236.firebaseapp.com',
    storageBucket: 'messaging-45236.appspot.com',
    measurementId: 'G-Y5ZXLSFS63',
  );
}
