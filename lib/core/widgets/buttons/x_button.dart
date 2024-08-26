import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class XButton extends StatelessWidget {
  const XButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        context.pop();
      },
      padding: const EdgeInsets.all(10),
      minSize: 45,
      child: SvgPicture.asset('assets/close.svg'),
    );
  }
}
