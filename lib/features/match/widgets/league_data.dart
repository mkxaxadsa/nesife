import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';

class LeagueData extends StatelessWidget {
  const LeagueData({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.navBarIcon,
          fontSize: 14,
        ),
      ),
    );
  }
}
