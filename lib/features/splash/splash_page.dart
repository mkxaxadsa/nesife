import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/app_colors.dart';
import '../../core/utils.dart';
import '../match/bloc/match_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  void load() async {
    await getData().then((value) {
      context.read<MatchBloc>().add(GetMatchesEvent());

      Future.delayed(const Duration(seconds: 2), () {
        if (onboard) {
          context.go('/onboard');
        } else {
          context.go('/home');
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
    load();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: SvgPicture.asset('assets/splash1.svg'),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset('assets/splash2.svg'),
          ),
          Positioned(
            bottom: 127,
            left: 0,
            right: 0,
            child: Column(
              children: [
                RotationTransition(
                  turns: _controller,
                  child: Transform.scale(
                    scaleX: -1,
                    child: SvgPicture.asset('assets/loading.svg'),
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'LOADING...',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    fontFamily: Fonts.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
