import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../bloc/match_bloc.dart';

class MatchErrorWidget extends StatelessWidget {
  const MatchErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Error',
            style: TextStyle(
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 6),
          PrimaryButton(
            title: 'Try again',
            onPressed: () {
              context.read<MatchBloc>().add(GetMatchesEvent());
            },
          ),
        ],
      ),
    );
  }
}
