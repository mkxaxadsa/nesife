import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    this.active = true,
    required this.onPressed,
  });

  final String title;
  final bool active;

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: active ? onPressed : null,
      padding: EdgeInsets.zero,
      child: Container(
        height: 48,
        width: 220,
        decoration: BoxDecoration(
          color: AppColors.main,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: active ? AppColors.white : Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: Fonts.medium,
            ),
          ),
        ),
      ),
    );
  }
}
