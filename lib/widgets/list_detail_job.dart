import 'package:flutter/material.dart';

import '../theme.dart';

class ListDescJob extends StatelessWidget {
  const ListDescJob({Key? key, required this.descJob}) : super(key: key);

  final String descJob;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        children: [
          Image.asset(
            'assets/dot.png',
            width: 12,
            height: 12,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            descJob,
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: regular,
            ),
          ),
        ],
      ),
    );
  }
}
