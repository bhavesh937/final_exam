import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return windows;
    }
    switch (defaultTargetPlatform) {



      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );

      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }



  static const FirebaseOptions windows = FirebaseOptions(
      apiKey: 'AIzaSyALoHz-AF2ayNhGZDxLByE8q412_KJTEVQ',
      appId: '1:539967177894:android:dbe28f7fedd596c379e067',
      messagingSenderId: '539967177894',
      projectId: 'fir-b2bc9');




}
