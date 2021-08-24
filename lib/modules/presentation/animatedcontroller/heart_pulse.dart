import 'package:flutter/material.dart';

class HeartPulse extends StatefulWidget {
  const HeartPulse({Key key}) : super(key: key);

  @override
  _HeartPulseState createState() => _HeartPulseState();
}

class _HeartPulseState extends State<HeartPulse>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<Color> colorAnimation;
  Animation<double> sizeAnimation;
  Animation<double> curve;
  bool isFav = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(
        milliseconds: 300,
      ),
      vsync: this,
    );

    curve = CurvedAnimation(
      parent: animationController,
      curve: Curves.slowMiddle,
    );

    colorAnimation =
        ColorTween(begin: Colors.grey[400], end: Colors.red).animate(curve);

    sizeAnimation = TweenSequence<double>(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: 30,
            end: 0,
          ),
          weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: 0,
            end: 30,
          ),
          weight: 50),
    ]).animate(curve);

    animationController.addListener(() {});

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isFav = true;
        });
      } else {
        setState(() {
          isFav = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, _) {
        return IconButton(
          icon: Icon(
            Icons.favorite,
            color: colorAnimation.value,
            size: sizeAnimation.value,
          ),
          onPressed: () {
            isFav
                ? animationController.reverse()
                : animationController.forward();
          },
        );
      },
    );
  }
}
