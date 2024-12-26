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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBbmhP_i_J8OXx9DG1fbq-Ri-aiDHeBoJk',
    appId: '1:605279372289:web:5981d27eabe92e42d52c00',
    messagingSenderId: '605279372289',
    projectId: 'apkmasak-93233',
    authDomain: 'apkmasak-93233.firebaseapp.com',
    storageBucket: 'apkmasak-93233.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAGuLbHW_EjzFOAR8Pcmv_ICqHbGidZLuc',
    appId: '1:605279372289:android:c98efa30d8573cb1d52c00',
    messagingSenderId: '605279372289',
    projectId: 'apkmasak-93233',
    storageBucket: 'apkmasak-93233.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAJFn85mkZbUMoIg-nYgWTqZAGjKwn6xms',
    appId: '1:605279372289:ios:0e0b75571044e33ad52c00',
    messagingSenderId: '605279372289',
    projectId: 'apkmasak-93233',
    storageBucket: 'apkmasak-93233.firebasestorage.app',
    iosBundleId: 'com.example.apkmasak',
  );
}
