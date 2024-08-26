import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/title_text.dart';

class PuzzlePage extends StatelessWidget {
  const PuzzlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TitleText('Puzzles'),
        SizedBox(height: 20),
        Row(
          children: [
            SizedBox(width: 36),
            Text(
              'Choose the puzzles you’re\ngoing to put together',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _PuzzleCard(id: 1, title: 'Player'),
            SizedBox(width: 8),
            _PuzzleCard(id: 2, title: 'Ball'),
          ],
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _PuzzleCard(id: 3, title: 'Goal'),
            SizedBox(width: 8),
            _PuzzleCard(id: 4, title: 'Referee'),
          ],
        ),
      ],
    );
  }
}

class _PuzzleCard extends StatelessWidget {
  const _PuzzleCard({
    required this.id,
    required this.title,
  });

  final int id;
  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width / 2 - 20;

    return CupertinoButton(
      onPressed: () {
        context.push('/puzzle', extra: id);
      },
      padding: EdgeInsets.zero,
      child: SizedBox(
        height: size,
        width: size,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/puzzle/p$id.png',
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.white),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.black0,
                    AppColors.main50,
                  ],
                ),
              ),
            ),
            Positioned(
              left: 16,
              bottom: 16,
              child: Text(
                title,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
