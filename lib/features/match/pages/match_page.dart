import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/loading_widget.dart';
import '../../../core/widgets/title_text.dart';
import '../bloc/match_bloc.dart';
import '../widgets/match_card.dart';
import '../widgets/match_error_widget.dart';

class MatchPage extends StatelessWidget {
  const MatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchBloc, MatchState>(
      builder: (context, state) {
        if (state is MatchLoadingState) return const LoadingWidget();

        if (state is MatchErrorState) return const MatchErrorWidget();

        if (state is MatchesLoadedState) {
          return Padding(
            padding: EdgeInsets.only(bottom: navBarHeight),
            child: Scrollbar(
              radius: const Radius.circular(2),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const TitleText('Matches'),
                  const SizedBox(height: 30),
                  ...List.generate(
                    state.matches.length,
                    (index) {
                      return MatchCard(model: state.matches[index]);
                    },
                  ),
                ],
              ),
            ),
          );
        }

        return Container();
      },
    );
  }
}
