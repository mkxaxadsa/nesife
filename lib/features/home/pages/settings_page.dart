import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/title_text.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TitleText('Settings'),
        SizedBox(height: 68),
        _SettingsTile(
          title: 'Share with friends',
          id: 1,
          action: _shareApp,
        ),
        SizedBox(height: 25),
        _SettingsTile(
          title: 'Write support',
          id: 2,
          action: _openSupportLink,
        ),
        SizedBox(height: 25),
        _SettingsTile(
          title: 'Terms of use',
          id: 3,
          action: _openTermsLink,
        ),
        SizedBox(height: 25),
        _SettingsTile(
          title: 'Privacy Policy',
          id: 4,
          action: _openPolicyLink,
        ),
      ],
    );
  }

  static void _shareApp() {
    Share.share('Check out Nesife: Sport Activity in AppStore!',
        subject: 'Nesife: Sport Activity');
  }

  static Future<void> _openSupportLink() async {
    const url = 'https://forms.gle/S4zPo8Caezw81gss6';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> _openTermsLink() async {
    const url =
        'https://docs.google.com/document/d/1npo9zWtfZRZYJizZHPtDXDaPdO-9HeazCM30tLQ6VpU/edit?usp=sharing';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> _openPolicyLink() async {
    const url =
        'https://docs.google.com/document/d/1yFYZ9ZRc0U7DHV0hZJq7qvJ_G8KuWJMz9aULCeVWBwQ/edit?usp=sharing';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.title,
    required this.id,
    required this.action,
  });

  final String title;
  final int id;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47,
      margin: const EdgeInsets.symmetric(horizontal: 33),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.settingsTile,
      ),
      child: CupertinoButton(
        onPressed: action,
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            const SizedBox(width: 18),
            SvgPicture.asset('assets/settings$id.svg'),
            const SizedBox(width: 9),
            Text(
              title,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 20,
                fontFamily: Fonts.regular,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.chevron_right,
              color: AppColors.white,
              size: 30,
            ),
            const SizedBox(width: 9),
          ],
        ),
      ),
    );
  }
}
