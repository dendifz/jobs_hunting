import 'package:flutter/material.dart';
import 'package:jobs_hunting/pages/home_page.dart';
import 'package:jobs_hunting/pages/onboarding_page.dart';
import 'package:jobs_hunting/providers/auth_provider.dart';
import 'package:jobs_hunting/pages/signin_page.dart';
import 'package:jobs_hunting/pages/signup_page.dart';
import 'package:jobs_hunting/pages/splash_page.dart';
import 'package:jobs_hunting/providers/category_provider.dart';
import 'package:jobs_hunting/providers/job_provider.dart';
import 'package:jobs_hunting/providers/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (context) => AuthProvider()),
        ChangeNotifierProvider<UserProvider>(create: (context) => UserProvider()),
        ChangeNotifierProvider<CategoryProvider>(create: (context) => CategoryProvider()),
        ChangeNotifierProvider<JobProvider>(create: (context) => JobProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/onboarding': (context) => const OnboardingPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/home': (context) => const HomePage(),
        },
      ),
    );
  }
}
