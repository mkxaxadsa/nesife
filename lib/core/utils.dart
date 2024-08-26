import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/home/bloc/home_bloc.dart';

double navBarHeight = 90;

bool onboard = true;
int lastLoadDay = 1;
String jsonData = '';

Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  // await prefs.remove('onboard');
  onboard = prefs.getBool('onboard') ?? true;
  lastLoadDay = prefs.getInt('lastLoadDay') ?? 1;
  jsonData = prefs.getString('jsonData') ?? '';
}

Future<void> saveData() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('onboard', false);
}

Future<void> saveLoad(int day, String json) async {
  final prefs = await SharedPreferences.getInstance();
  lastLoadDay = day;
  jsonData = json;
  prefs.setInt('lastLoadDay', day);
  prefs.setString('jsonData', json);
  log('lastLoadDay = $day');
}

int getCurrentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

String convertToDate(int timestamp) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  String formattedDate =
      '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}';
  return formattedDate;
}

String convertToTime(int timestamp) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  String formattedTime =
      '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  return formattedTime;
}

double getStatusBar(BuildContext context) {
  return MediaQuery.of(context).viewPadding.top;
}

double getBottom(BuildContext context) {
  return MediaQuery.of(context).viewPadding.bottom;
}

int getBG(HomeState state) {
  if (state is HomeInitial) return 1;
  if (state is HomeNews) return 2;
  if (state is HomePuzzle) return 3;
  return 0;
}

String getPuzzleAsset(int id) {
  if (id == 1) return 'pp';
  if (id == 2) return 'bb';
  if (id == 3) return 'gg';
  if (id == 4) return 'rr';
  return 'pp1';
}

String getPuzzleName(int id) {
  if (id == 1) return 'Player';
  if (id == 2) return 'Ball';
  if (id == 3) return 'Goal';
  if (id == 4) return 'Referee';
  return '';
}
