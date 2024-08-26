import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.body,
    this.color = AppColors.black,
    this.bg = 0,
    this.started = false,
  });

  final Widget body;
  final Color color;
  final int bg;
  final bool started;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                // bg color
                Container(decoration: BoxDecoration(color: color)),
                // bg image
                if (bg != 0)
                  Image.asset(
                    'assets/bg$bg.png',
                    height: 210,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                // image gradient
                if (bg != 0)
                  Container(
                    height: 210,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.black.withOpacity(0),
                          AppColors.black,
                        ],
                      ),
                    ),
                  ),
                if (started)
                  Stack(
                    children: [
                      ColorFiltered(
                        colorFilter: const ColorFilter.mode(
                          Colors.black,
                          BlendMode.color,
                        ),
                        child: Image.asset(
                          'assets/puzzle/p$bg.png',
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        color: Colors.black.withOpacity(0.7),
                      )
                    ],
                  ),
                // content
                body,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
