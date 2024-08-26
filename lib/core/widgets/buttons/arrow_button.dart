import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../utils.dart';

class ArrowButton extends StatelessWidget {
  const ArrowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20 + getStatusBar(context)),
      child: CupertinoButton(
        onPressed: () {
          context.pop();
        },
        padding: const EdgeInsets.all(20),
        child: SvgPicture.asset('assets/arrow.svg'),
      ),
    );
  }
}
