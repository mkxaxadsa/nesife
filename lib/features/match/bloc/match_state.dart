part of 'match_bloc.dart';

abstract class MatchState {}

class MatchInitial extends MatchState {}

class MatchLoadingState extends MatchState {}

class MatchesLoadedState extends MatchState {
  final List<MatchModel> matches;
  MatchesLoadedState({required this.matches});
}

class MatchErrorState extends MatchState {}
