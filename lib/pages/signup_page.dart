import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isNameValid = false;
  bool isGoalValid = false;

  bool isChangeImage = false;

  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passController = TextEditingController(text: '');
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController goalController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
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
                  'Sign Up',
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: light,
                  ),
                ),
                Text(
                  'Begin New Journey',
                  style: blackTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: regular,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: blackColor,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            if (isChangeImage == false) {
                              setState(() {
                                isChangeImage = true;
                              });
                            } else {
                              setState(() {
                                isChangeImage = false;
                              });
                            }
                          },
                          child: Image.asset(
                            isChangeImage ? 'assets/icon_upload.png' : 'assets/image_profile.png',
                            width: 120,
                            height: 120,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: nameController,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        isNameValid = true;
                      });
                    } else {
                      setState(() {
                        isNameValid = false;
                      });
                    }
                  },
                  style: greyTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                    color: isNameValid ? primaryColor : redColor,
                  ),
                  decoration: InputDecoration(
                    fillColor: whiteColor,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(
                          color:
                          isNameValid ? primaryColor : redColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide.none,
                    ),
                    labelText: 'Full Name',
                    hintText: 'Your Name',
                  ),
                ),
                const SizedBox(
                  height: 20,
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
                TextFormField(
                  controller: goalController,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        isGoalValid = true;
                      });
                    } else {
                      setState(() {
                        isGoalValid = false;
                      });
                    }
                  },
                  style: greyTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                    color: isGoalValid ? primaryColor : redColor,
                  ),
                  decoration: InputDecoration(
                    fillColor: whiteColor,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(color: isGoalValid ? primaryColor : redColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide.none,
                    ),
                    labelText: 'Goal',
                    hintText: 'Your Goal',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xff4141A4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(66),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/profile');
                    },
                    child: Text(
                      'Sign Up',
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
                      Navigator.pushNamed(context, '/sign-in');
                    },
                    child: Text(
                      'Back To Sign In',
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
