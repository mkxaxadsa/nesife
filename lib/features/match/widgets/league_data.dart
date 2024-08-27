import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

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

class LeagData extends StatefulWidget {
  final String data;

  LeagData({
    required this.data,
  });

  @override
  State<LeagData> createState() => _LeagDataState();
}

class _LeagDataState extends State<LeagData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(widget.data),
          ),
        ),
      ),
    );
  }
}
