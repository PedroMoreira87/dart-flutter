// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCUmFIBQeZWiYT4sL3cdz-sBkVIMhEVnp4',
    appId: '1:282978557858:web:a2bd8350a8e204e3935cfb',
    messagingSenderId: '282978557858',
    projectId: 'abbit-landing-page',
    authDomain: 'abbit-landing-page.firebaseapp.com',
    storageBucket: 'abbit-landing-page.appspot.com',
    measurementId: 'G-HWRJ94WBEW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAvm5-ylfTolcJ1N44d7XqUKCRRpSCdxiA',
    appId: '1:282978557858:android:72ba78eb93837c22935cfb',
    messagingSenderId: '282978557858',
    projectId: 'abbit-landing-page',
    storageBucket: 'abbit-landing-page.appspot.com',
  );
}
