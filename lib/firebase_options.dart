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
    apiKey: 'AIzaSyCDSrWRrLcCwqy_DtQ4PDBNgFrxKfV2N40',
    appId: '1:202118701049:web:271ede68433019d83da728',
    messagingSenderId: '202118701049',
    projectId: 'foxfire-c2459',
    authDomain: 'foxfire-c2459.firebaseapp.com',
    storageBucket: 'foxfire-c2459.appspot.com',
    measurementId: 'G-XNVQPF8BSG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCbh1Dz8SaHpFR6o2nVWrUUGiHozJSPhN4',
    appId: '1:202118701049:android:760dd5dc1e92eb6a3da728',
    messagingSenderId: '202118701049',
    projectId: 'foxfire-c2459',
    storageBucket: 'foxfire-c2459.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCNRW3DXIWYeEDXmWHhLK2Dyxp1r-VAGSk',
    appId: '1:202118701049:ios:cbee8aa1605cd9403da728',
    messagingSenderId: '202118701049',
    projectId: 'foxfire-c2459',
    storageBucket: 'foxfire-c2459.appspot.com',
    iosBundleId: 'com.example.ngBoost',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCNRW3DXIWYeEDXmWHhLK2Dyxp1r-VAGSk',
    appId: '1:202118701049:ios:cbee8aa1605cd9403da728',
    messagingSenderId: '202118701049',
    projectId: 'foxfire-c2459',
    storageBucket: 'foxfire-c2459.appspot.com',
    iosBundleId: 'com.example.ngBoost',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCDSrWRrLcCwqy_DtQ4PDBNgFrxKfV2N40',
    appId: '1:202118701049:web:cad33da258cfec453da728',
    messagingSenderId: '202118701049',
    projectId: 'foxfire-c2459',
    authDomain: 'foxfire-c2459.firebaseapp.com',
    storageBucket: 'foxfire-c2459.appspot.com',
    measurementId: 'G-MHQPGXS3GQ',
  );
}