import 'package:flutter/material.dart';
import 'package:jobs_hunting/pages/second_home_page.dart';

import '../theme.dart';

class JobCard extends StatelessWidget {
  const JobCard({Key? key, required this.imageDesc, required this.imageUrl}) : super(key: key);

  final String imageDesc;
  final String imageUrl;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondHomePage(
              jobTitle: imageDesc,
              urlImage: imageUrl,
            ),
          ),
        );
      },
      child: Row(
        children: [
          Container(
            height: 200,
            width: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
              ),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 12, right: 12),
                child: Text(
                  imageDesc,
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }
}
