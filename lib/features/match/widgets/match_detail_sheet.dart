import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/x_button.dart';
import '../../../core/models/match_model.dart';
import 'club_data.dart';
import 'league_data.dart';

class MatchDetailSheet extends StatelessWidget {
  const MatchDetailSheet({super.key, required this.model});

  final MatchModel model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 137,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(12),
            ),
            child: Image.asset(
              'assets/bg4.png',
              height: 210,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
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
          const Positioned(
            right: 0,
            top: 0,
            child: XButton(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SizedBox(height: 122),
                _ClubsCard(model: model),
                const SizedBox(height: 18),
                _DetailCard(model: model),
                const SizedBox(height: 18),
                _DetailCard2(model: model),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ClubsCard extends StatelessWidget {
  const _ClubsCard({required this.model});

  final MatchModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.main90,
      ),
      child: Column(
        children: [
          LeagueData(title: model.league),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClubData(
                title: model.homeTeamTitle,
                image: 'assets/green.png',
              ),
              const SizedBox(
                width: 70,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 18),
                      Text(
                        'VS',
                        style: TextStyle(
                          color: AppColors.navBarIcon,
                          fontSize: 16,
                          fontFamily: Fonts.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ClubData(
                title: model.awayTeamTitle,
                image: 'assets/red.png',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DetailCard extends StatelessWidget {
  const _DetailCard({required this.model});

  final MatchModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 194,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.main90,
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                'Season series',
                style: TextStyle(
                  color: AppColors.navBarIcon,
                  fontSize: 16,
                  fontFamily: Fonts.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.homeTeamTitle,
                style: const TextStyle(
                  color: AppColors.navBarIcon,
                  fontSize: 14,
                ),
              ),
              Text(
                '${model.homeGoals1 + model.homeGoals2}',
                style: const TextStyle(
                  color: AppColors.navBarIcon,
                  fontSize: 16,
                  fontFamily: Fonts.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.awayTeamTitle,
                style: const TextStyle(
                  color: AppColors.navBarIcon,
                  fontSize: 14,
                ),
              ),
              Text(
                '${model.awayGoals1 + model.awayGoals1}',
                style: const TextStyle(
                  color: AppColors.navBarIcon,
                  fontSize: 16,
                  fontFamily: Fonts.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 30,
                child: Center(
                  child: Text(
                    '1st',
                    style: TextStyle(
                      color: AppColors.navBarIcon,
                      fontSize: 14,
                      fontFamily: Fonts.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 25),
              SizedBox(
                width: 30,
                child: Center(
                  child: Text(
                    '2nd',
                    style: TextStyle(
                      color: AppColors.navBarIcon,
                      fontSize: 14,
                      fontFamily: Fonts.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 25),
              SizedBox(
                width: 40,
                child: Center(
                  child: Text(
                    'Total',
                    style: TextStyle(
                      color: AppColors.navBarIcon,
                      fontSize: 14,
                      fontFamily: Fonts.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.homeTeamTitle,
                style: const TextStyle(
                  color: AppColors.navBarIcon,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              _Text16('${model.homeGoals1}'),
              const SizedBox(width: 18),
              _Text16('${model.homeGoals2}'),
              const SizedBox(width: 18),
              _Text16('${model.homeGoals1 + model.homeGoals2}'),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                model.awayTeamTitle,
                style: const TextStyle(
                  color: AppColors.navBarIcon,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              _Text16('${model.awayGoals1}'),
              const SizedBox(width: 18),
              _Text16('${model.awayGoals2}'),
              const SizedBox(width: 18),
              _Text16('${model.awayGoals1 + model.awayGoals2}'),
            ],
          ),
        ],
      ),
    );
  }
}

class _DetailCard2 extends StatelessWidget {
  const _DetailCard2({required this.model});

  final MatchModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.main90,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                convertToDate(model.time),
                style: const TextStyle(
                  color: AppColors.navBarIcon,
                  fontSize: 16,
                  fontFamily: Fonts.bold,
                ),
              ),
              Text(
                convertToTime(model.time),
                style: const TextStyle(
                  color: AppColors.navBarIcon,
                  fontSize: 16,
                  fontFamily: Fonts.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.league,
                style: const TextStyle(
                  color: AppColors.navBarIcon,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              Expanded(
                child: Text(
                  model.stadium,
                  style: const TextStyle(
                    color: AppColors.navBarIcon,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Text16 extends StatelessWidget {
  const _Text16(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: AppColors.navBarIcon,
            fontSize: 16,
            fontFamily: Fonts.bold,
          ),
        ),
      ),
    );
  }
}
