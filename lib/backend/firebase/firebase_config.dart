import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBYCs0NxII3E-8kHmh5inFRTL14RViWxys",
            authDomain: "dashboardapps-57b1c.firebaseapp.com",
            projectId: "dashboardapps-57b1c",
            storageBucket: "dashboardapps-57b1c.appspot.com",
            messagingSenderId: "813406409653",
            appId: "1:813406409653:web:964d59810ad8959fe4bffc"));
  } else {
    await Firebase.initializeApp();
  }
}
