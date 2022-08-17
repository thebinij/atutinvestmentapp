import 'package:atutinvestmentapp/pages/login_page.dart';
import 'package:atutinvestmentapp/pages/verify_email.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../firebase_options.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            print(user);
            if (user != null) {
              if (user.emailVerified) {
                print('You are a verified user');
              } else {
                print('Please Verify');
                return const VerifyEmail();
              }
            } else {
              print('Please Login');
              return const LoginPage();
            }
            return const Text('Done!');
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
