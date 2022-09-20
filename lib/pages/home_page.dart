import "package:flutter/material.dart";
import 'package:jobs_hunting/widgets/custom_list.dart';
import 'package:jobs_hunting/widgets/job_card.dart';

import '../theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 30, left: 24, right: 24),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Howdy,',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: regular,
                    ),
                  ),
                  Text(
                    'Mr. Dendi',
                    style: blackTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Image.asset(
                'assets/image_profile.png',
                width: 58,
                height: 58,
              ),
            ],
          ),
        ),
      );
    }

    Widget body() {
      return Padding(
        padding: const EdgeInsets.only(top: 30, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hot Categories',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: regular,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  JobCard(
                    imageUrl: 'assets/image_category1.png',
                    imageDesc: 'Website Developer',
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  JobCard(
                    imageUrl: 'assets/image_category2.png',
                    imageDesc: 'Mobile Developer',
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  JobCard(
                    imageUrl: 'assets/image_category3.png',
                    imageDesc: 'App Designer',
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  JobCard(
                    imageUrl: 'assets/image_category4.png',
                    imageDesc: 'Content Writter',
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  JobCard(
                    imageUrl: 'assets/image_category5.png',
                    imageDesc: 'Video Grapher',
                  ),
                  SizedBox(
                    width: 16,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Just Posted',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: regular,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              children: const [
                CustomList(
                  jobTitle: 'Front End Developer',
                  jobCompany: 'Google',
                  imageUrl: 'assets/icon_google.png',
                ),
                CustomList(
                  jobTitle: 'UI Designer',
                  jobCompany: 'Instagram',
                  imageUrl: 'assets/icon_instagram.png',
                ),
                CustomList(
                  jobTitle: 'Data Scientist',
                  jobCompany: 'Facebook',
                  imageUrl: 'assets/icon_facebook.png',
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(top: 30),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          unselectedItemColor: greyColor,
          selectedItemColor: Colors.black,
          currentIndex: 0,
          elevation: 0,
          iconSize: 24,
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/icon_home.png'),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/icon_notification.png'),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/icon_love.png'),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/icon_user.png'),
              ),
              label: '',
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            body(),
          ],
        ),
      ),
    );
  }
}
