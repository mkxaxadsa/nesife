import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils.dart';
import '../../core/config/app_colors.dart';
import '../../core/widgets/buttons/primary_button.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/onboard.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            right: -55,
            bottom: 55,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(-28 / 360),
              child: Image.asset(
                'assets/onboard2.png',
                width: 300,
              ),
            ),
          ),
          Positioned(
            top: 40 + getStatusBar(context),
            left: 38,
            child: const Text(
              'Match history,\npuzzles and\narticles all in one\napp, enjoy!',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 32,
                fontFamily: Fonts.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 115 + getBottom(context),
            left: 0,
            right: 0,
            child: Center(
              child: PrimaryButton(
                title: 'GO',
                onPressed: () async {
                  await saveData().then((value) {
                    context.go('/home');
                  });
                },
              ),
            ),
          ),
          Positioned(
            bottom: 56 + getBottom(context),
            left: 0,
            right: 0,
            child: Center(
              child: CupertinoButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                minSize: 24,
                child: const Text(
                  'Terms of Use / Privacy Policy',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    fontFamily: Fonts.regular,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
