import 'package:flutter/material.dart';
import 'package:jobs_hunting/pages/home_page.dart';
import 'package:jobs_hunting/pages/onboarding_page.dart';
import 'package:jobs_hunting/pages/signin_page.dart';
import 'package:jobs_hunting/pages/signup_page.dart';
import 'package:jobs_hunting/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/onboarding': (context) => const OnboardingPage(),
        '/sign-in': (context) => const SignInPage(),
        '/sign-up': (context) => const SignUpPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
