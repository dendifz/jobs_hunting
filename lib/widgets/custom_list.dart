import 'package:flutter/material.dart';
import 'package:jobs_hunting/models/job_model.dart';
import 'package:jobs_hunting/pages/detail_page.dart';

import '../theme.dart';

class CustomList extends StatelessWidget {

  JobModel job;

  CustomList({
    required this.job
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              job: job
            ),
          ),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            job.companyLogo!,
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
                  job.name!,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                Text(
                  job.companyName!,
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
      ),
    );
  }
}
