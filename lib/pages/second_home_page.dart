import 'package:flutter/material.dart';
import 'package:jobs_hunting/theme.dart';
import 'package:jobs_hunting/widgets/custom_list.dart';

class SecondHomePage extends StatelessWidget {
  const SecondHomePage({Key? key, required this.jobTitle, required this.urlImage}) : super(key: key);

  final String jobTitle;
  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 270,
                      child: Image.asset(
                        urlImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 180,
                      left: 24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Website Developer',
                          style: whiteTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                        ),
                        Text(
                          '1290 Available Jobs',
                          style: whiteTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: light,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 24,
                  left: 24,
                  right: 24,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Popular Jobs',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: regular,
                          ),
                        ),
                        Text(
                          'See All',
                          style: purpleTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: regular,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const CustomList(
                      jobTitle: 'Front-End Developer',
                      jobCompany: 'Google',
                      imageUrl: 'assets/icon_google.png',
                    ),
                    const CustomList(
                      jobTitle: 'UI Designer',
                      jobCompany: 'Instagram',
                      imageUrl: 'assets/icon_instagram.png',
                    ),
                    const CustomList(
                      jobTitle: 'Data Scientist',
                      jobCompany: 'Facebook',
                      imageUrl: 'assets/icon_facebook.png',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Big Companies',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: regular,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const CustomList(
                      jobTitle: 'Front-End Developer',
                      jobCompany: 'Google',
                      imageUrl: 'assets/icon_google.png',
                    ),
                    const CustomList(
                      jobTitle: 'UI Designer',
                      jobCompany: 'Instagram',
                      imageUrl: 'assets/icon_instagram.png',
                    ),
                    const CustomList(
                      jobTitle: 'Data Scientist',
                      jobCompany: 'Facebook',
                      imageUrl: 'assets/icon_facebook.png',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
