import 'package:flutter/material.dart';

import '../theme.dart';

class JobCard extends StatelessWidget {
  const JobCard({Key? key, required this.imageDesc, required this.imageUrl}) : super(key: key);

  final String imageDesc;
  final String imageUrl;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageUrl),
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
    );
  }
}
