import 'package:chat/screens/chat_screen.dart';

import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:flutter_push_test/screens/auth_screen.dart';
// import 'package:flutter_push_test/screens/chat_screen.dart';
// import 'package:flutter_push_test/screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, appSnapshot) {
          return MaterialApp(
            title: 'FlutterChat',
            theme: ThemeData(
              primarySwatch: Colors.pink,
              backgroundColor: Colors.pink,
              accentColor: Colors.deepPurple,
              accentColorBrightness: Brightness.dark,
              buttonTheme: ButtonTheme.of(context).copyWith(
                buttonColor: Colors.pink,
                textTheme: ButtonTextTheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            home: ChatScreen(),

            /* appSnapshot.connectionState != ConnectionState.done ? SplashScreen() : StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (ctx, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          }
          if (userSnapshot.hasData) {
            return ChatScreen();
          }
          return AuthScreen();
        }), */
          );
        });
  }
}