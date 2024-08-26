import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../match/pages/match_page.dart';
import '../../news/pages/news_page.dart';
import '../../puzzle/pages/puzzle_page.dart';
import '../bloc/home_bloc.dart';
import '../widgets/nav_bar.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return CustomScaffold(
          bg: getBG(state),
          body: Stack(
            children: [
              if (state is HomeInitial) const MatchPage(),
              if (state is HomeNews) const NewsPage(),
              if (state is HomePuzzle) const PuzzlePage(),
              if (state is HomeSettings) const SettingsPage(),
              const NavBar(),
            ],
          ),
        );
      },
    );
  }
}
