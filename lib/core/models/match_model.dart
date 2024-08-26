class MatchModel {
  const MatchModel({
    required this.homeTeamTitle,
    required this.homeTeamLogo,
    required this.awayTeamTitle,
    required this.awayTeamLogo,
    required this.homeGoals1,
    required this.homeGoals2,
    required this.awayGoals1,
    required this.awayGoals2,
    required this.time,
    required this.league,
    required this.stadium,
  });

  final String homeTeamTitle;
  final String homeTeamLogo;
  final String awayTeamTitle;
  final String awayTeamLogo;
  final int homeGoals1;
  final int homeGoals2;
  final int awayGoals1;
  final int awayGoals2;
  final int time;
  final String league;
  final String stadium;

  factory MatchModel.fromJson(Map<String, dynamic> json) {
    return MatchModel(
      homeTeamTitle: json['teams']['home']['name'],
      homeTeamLogo: json['teams']['home']['logo'],
      awayTeamTitle: json['teams']['away']['name'],
      awayTeamLogo: json['teams']['away']['logo'],
      homeGoals1: json['score']['halftime']['home'] ?? 0,
      homeGoals2: json['score']['fulltime']['home'] ?? 0,
      awayGoals1: json['score']['halftime']['away'] ?? 0,
      awayGoals2: json['score']['fulltime']['away'] ?? 0,
      time: json['fixture']['periods']['second'] ?? 0,
      league: json['league']['name'],
      stadium: json['fixture']['venue']['name'] ?? '',
    );
  }
}
