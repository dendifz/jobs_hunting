import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:jobs_hunting/theme.dart';
import 'package:provider/provider.dart';

import '../models/user_model.dart';
import '../providers/auth_provider.dart';
import '../providers/user_provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isLoading = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);

    void showMessage(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: redColor,
          content: Text(message),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign In',
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: light,
                  ),
                ),
                Text(
                  'Build Your Career',
                  style: blackTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: regular,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/image_sign_in.png',
                      width: MediaQuery.of(context).size.width,
                      height: 240,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: emailController,
                  onChanged: (value) {
                    bool isValid = EmailValidator.validate(value);
                    if (isValid) {
                      setState(() {
                        isEmailValid = true;
                      });
                    } else {
                      setState(() {
                        isEmailValid = false;
                      });
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: greyTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                    color: isEmailValid ? primaryColor : redColor,
                  ),
                  decoration: InputDecoration(
                    fillColor: whiteColor,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(
                        color: isEmailValid ? primaryColor : redColor,
                      ),
                    ),
                    labelText: 'Email Address',
                    hintText: 'Your Email Address',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passController,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        isPasswordValid = true;
                      });
                    } else {
                      setState(() {
                        isPasswordValid = false;
                      });
                    }
                  },
                  obscureText: true,
                  style: greyTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                  ),
                  decoration: InputDecoration(
                    fillColor: whiteColor,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(
                          color: isPasswordValid ? primaryColor : redColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide.none,
                    ),
                    labelText: 'Password',
                    hintText: 'Your Password',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  child: isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xff4141A4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(66),
                            ),
                          ),
                          onPressed: () async {
                            if (isEmailValid && isPasswordValid) {
                              setState(() {
                                isLoading = true;
                              });
                              UserModel? user = await authProvider.login(
                                  emailController.text, passController.text);
                              if (user == null) {
                                showMessage('Email or Password Wrong');
                              } else {
                                userProvider.user = user;
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/home', (route) => false);
                              }
                              setState(() {
                                isLoading = false;
                              });
                            } else {
                              showMessage('Please fill all fields');
                            }
                          },
                          child: Text(
                            'Sign In',
                            style: blackTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: medium,
                              color: whiteColor,
                            ),
                          ),
                        ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/sign-up');
                    },
                    child: Text(
                      'Create New Account',
                      style: greyTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: light,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
