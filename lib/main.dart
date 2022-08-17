import 'package:atutinvestmentapp/pages/home_page.dart';
import 'package:atutinvestmentapp/pages/login_page.dart';
import 'package:atutinvestmentapp/pages/register_page.dart';
import 'package:atutinvestmentapp/pages/verify_email.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: "Welcome To Atut Investment!",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/verify': (context) => const VerifyEmail()
      },
    ),
  );
}
