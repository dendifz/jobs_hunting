import 'package:flutter/material.dart';

import '../theme.dart';

class CustomList extends StatelessWidget {
  const CustomList(
      {Key? key,
      required this.jobTitle,
      required this.jobCompany,
      required this.imageUrl})
      : super(key: key);

  final String jobTitle;
  final String jobCompany;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl,
          width: 45,
          height: 45,
        ),
        const SizedBox(
          width: 28,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                jobTitle,
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              Text(
                jobCompany,
                style: greyTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: regular,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const Divider(
                color: Color(0xffe4e4e4),
                thickness: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
