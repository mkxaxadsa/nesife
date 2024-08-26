import 'package:flutter/material.dart';

import '../../../core/models/news_model.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/title_text.dart';
import '../widgets/news_card.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: navBarHeight),
      child: Scrollbar(
        radius: const Radius.circular(2),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const TitleText('News'),
            const SizedBox(height: 30),
            ...List.generate(
              newsList.length,
              (index) {
                return NewsCard(model: newsList[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
