import 'package:flutter/material.dart';
import 'package:vicoba_app_final_year_project/screen/splash_screen/fadeInAnimation/fia_model.dart';

class SfadeInAnimation extends StatelessWidget {
  const SfadeInAnimation({
    Key? key,
    required this.animate,
    required this.durationInMs,
    required this.child,
    this.animatePosition,
  }) : super(key: key);

  final bool animate;
  final int durationInMs;
  final sAnimatePosition? animatePosition;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: durationInMs),
      top: animate ? animatePosition!.topAfter:animatePosition!.topBefore,
      left: animate ? animatePosition!.leftAfter:animatePosition!.leftBefore,
      bottom: animate ? animatePosition!.bottomAfter:animatePosition!.bottomBefore,
      right: animate ? animatePosition!.rightAfter:animatePosition!.rightBefore,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: durationInMs),
        opacity: animate ? 1 : 0,
        child: child,
      ),
    );
  }
}
