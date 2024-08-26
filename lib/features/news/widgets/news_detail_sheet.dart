import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/news_model.dart';
import '../../../core/widgets/buttons/x_button.dart';

class NewsDetailSheet extends StatelessWidget {
  const NewsDetailSheet({super.key, required this.model});

  final NewsModel model;

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
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                AppColors.main90,
                BlendMode.color,
              ),
              child: CachedNetworkImage(
                imageUrl: model.image,
                height: 209,
                width: double.infinity,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) {
                  return Container();
                },
              ),
            ),
            // child: Image.asset(
            //   model.image,
            //   height: 210,
            //   width: double.infinity,
            //   fit: BoxFit.cover,
            // ),
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
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              children: [
                const SizedBox(height: 122),
                Text(
                  model.title,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 24,
                    fontFamily: Fonts.bold,
                  ),
                ),
                const SizedBox(height: 20),
                _BodyCard(model: model),
                const SizedBox(height: 30),
              ],
            ),
          ),
          const Positioned(
            right: 0,
            top: 0,
            child: XButton(),
          ),
        ],
      ),
    );
  }
}

class _BodyCard extends StatelessWidget {
  const _BodyCard({required this.model});

  final NewsModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.main90,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        model.body,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: AppColors.navBarIcon,
          fontSize: 20,
        ),
      ),
    );
  }
}
