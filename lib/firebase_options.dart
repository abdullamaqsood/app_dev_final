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
    apiKey: 'AIzaSyBe6wEURvs_63kGI1dS8QZQU-lDNxs1vyM',
    appId: '1:21991197370:web:e09eaac0c6edc0bef8d083',
    messagingSenderId: '21991197370',
    projectId: 'app-dev-final-d19db',
    authDomain: 'app-dev-final-d19db.firebaseapp.com',
    storageBucket: 'app-dev-final-d19db.firebasestorage.app',
    measurementId: 'G-808B8SH9TN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCYevpmLDu_pN4v81ul-vx_UW0Z844EJ7M',
    appId: '1:21991197370:android:4d76a24c858c635bf8d083',
    messagingSenderId: '21991197370',
    projectId: 'app-dev-final-d19db',
    storageBucket: 'app-dev-final-d19db.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyABz2kuN_z0yQixlUOcmh1sH1JK-Ysy5Rk',
    appId: '1:21991197370:ios:4b155afbe2703466f8d083',
    messagingSenderId: '21991197370',
    projectId: 'app-dev-final-d19db',
    storageBucket: 'app-dev-final-d19db.firebasestorage.app',
    iosBundleId: 'com.example.appDevFinal',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyABz2kuN_z0yQixlUOcmh1sH1JK-Ysy5Rk',
    appId: '1:21991197370:ios:4b155afbe2703466f8d083',
    messagingSenderId: '21991197370',
    projectId: 'app-dev-final-d19db',
    storageBucket: 'app-dev-final-d19db.firebasestorage.app',
    iosBundleId: 'com.example.appDevFinal',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBe6wEURvs_63kGI1dS8QZQU-lDNxs1vyM',
    appId: '1:21991197370:web:322a72a6f7e71489f8d083',
    messagingSenderId: '21991197370',
    projectId: 'app-dev-final-d19db',
    authDomain: 'app-dev-final-d19db.firebaseapp.com',
    storageBucket: 'app-dev-final-d19db.firebasestorage.app',
    measurementId: 'G-YR3JN5L523',
  );
}
