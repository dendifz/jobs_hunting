import 'package:flutter/material.dart';
import 'package:jobs_hunting/theme.dart';

import '../widgets/list_detail_job.dart';

class DetailPage extends StatefulWidget {
  const DetailPage(
      {Key? key,
      required this.jobTitle,
      required this.urlImage,
      required this.jobCompany})
      : super(key: key);

  final String jobTitle;
  final String urlImage;
  final String jobCompany;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isApplied = false;

  @override
  Widget build(BuildContext context) {
    Widget applyButton() {
      return Container(
        width: 150,
        height: 50,
        child: TextButton(
          onPressed: () {
            setState(() {
              isApplied = !isApplied;
            });
          },
          style: TextButton.styleFrom(
            backgroundColor: isApplied ? redColor : primaryColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(66),
              ),
            ),
          ),
          child: Text(
            isApplied ? 'Applied' : 'Apply Now',
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget cancelApply() {
      return Container(
        width: 150,
        height: 50,
        child: TextButton(
          onPressed: () {
            setState(() {
              isApplied = !isApplied;
            });
          },
          style: TextButton.styleFrom(
            backgroundColor: isApplied ? redColor : primaryColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(66),
              ),
            ),
          ),
          child: Text(
            isApplied ? 'Cancel Apply' : 'Apply Now',
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget successAppliedMessage() {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          color: transparentColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          'You have successfully applied for this job\n recruiter will contact you',
          textAlign: TextAlign.center,
          style: greyTextStyle.copyWith(
            fontSize: 14,
            fontWeight: regular,
          ),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              isApplied ? successAppliedMessage(): const SizedBox(height: 80,),
              Image.asset(widget.urlImage, width: 60, height: 60),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.jobTitle,
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
              Text(
                widget.jobCompany,
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: regular,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About the job',
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                    ),
                    Column(
                      children: const [
                        ListDescJob(
                          descJob: 'Full Time On Site',
                        ),
                        ListDescJob(
                          descJob: 'Start at \$18,000 per month',
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Requirements',
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                    ),
                    Column(
                      children: const [
                        ListDescJob(
                          descJob: 'Minimum 2 years experience',
                        ),
                        ListDescJob(
                          descJob: 'Good communication skill',
                        ),
                        ListDescJob(
                          descJob: 'Good team player',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Responsibilities',
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                    ),
                    Column(
                      children: const [
                        ListDescJob(
                          descJob: 'Designing and developing new features',
                        ),
                        ListDescJob(
                          descJob:
                              'Maintaining and improving the existing features',
                        ),
                        ListDescJob(
                          descJob:
                              'Working with the team to build new features',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'About the company',
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                    ),
                    Column(
                      children: const [
                        ListDescJob(
                          descJob: 'We are a startup company',
                        ),
                        ListDescJob(
                          descJob: 'We are located in Jakarta',
                        ),
                        ListDescJob(
                          descJob: 'We are looking for a new team member',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Container(
                        width: 200,
                        height: 50,
                        child: isApplied ? cancelApply() : applyButton(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        'Message Recruiter',
                        style: greyTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: light,
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
