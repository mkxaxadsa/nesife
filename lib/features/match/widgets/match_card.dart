import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/match_model.dart';
import 'club_data.dart';
import 'league_data.dart';
import 'match_detail_sheet.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({super.key, required this.model});

  final MatchModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 172,
      margin: const EdgeInsets.only(
        bottom: 27,
        left: 30,
        right: 30,
      ),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.main90,
      ),
      child: Column(
        children: [
          LeagueData(title: model.league),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClubData(
                title: model.homeTeamTitle,
                image: 'assets/green.png',
              ),
              _ScoreData(
                score1: '${model.homeGoals1} - ${model.awayGoals1}',
                score2: '${model.homeGoals2} - ${model.awayGoals2}',
              ),
              ClubData(
                title: model.awayTeamTitle,
                image: 'assets/red.png',
              ),
            ],
          ),
          const Spacer(),
          _StatsButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isDismissible: false,
                isScrollControlled: true,
                backgroundColor: AppColors.black,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                ),
                builder: (BuildContext context) {
                  return MatchDetailSheet(model: model);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ScoreData extends StatelessWidget {
  const _ScoreData({
    required this.score1,
    required this.score2,
  });

  final String score1;
  final String score2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: Column(
        children: [
          const SizedBox(height: 7),
          Text(
            score1,
            style: const TextStyle(
              color: AppColors.navBarIcon,
              fontSize: 16,
              fontFamily: Fonts.bold,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            score2,
            style: const TextStyle(
              color: AppColors.navBarIcon,
              fontSize: 16,
              fontFamily: Fonts.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatsButton extends StatelessWidget {
  const _StatsButton({required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      minSize: 36,
      child: Container(
        height: 36,
        width: 132,
        decoration: BoxDecoration(
          color: const Color(0xff977900),
          borderRadius: BorderRadius.circular(8),
          border: const Border(
            bottom: BorderSide(
              color: AppColors.white,
              width: 1,
            ),
          ),
        ),
        child: const Center(
          child: Text(
            'Game Stats',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontFamily: Fonts.regular,
            ),
          ),
        ),
      ),
    );
  }
}
