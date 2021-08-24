import 'package:flutter/material.dart';

class AnitationImage extends StatefulWidget {
  final String imageUrl;
  const AnitationImage(
      {Key key, this.imageUrl = 'assets/images/onepiecelogo.png'})
      : super(key: key);

  @override
  _AnitationImageState createState() => _AnitationImageState();
}

class _AnitationImageState extends State<AnitationImage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> curve;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    curve =
        CurvedAnimation(parent: animationController, curve: Curves.bounceOut);
    animation = Tween<double>(begin: 0, end: 300).animate(curve)
      ..addListener(() {
        setState(() {});
      });

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        child: Container(
          height: animation.value,
          width: animation.value,
          color: Colors.transparent,
          child: Image.asset(widget.imageUrl),
        ),
        tween: Tween<double>(begin: 0, end: 1),
        duration: Duration(seconds: 3),
        curve: Curves.bounceOut,
        builder: (context, double _val, child) {
          return Opacity(
            opacity: _val,
            child: child,
          );
        });
  }
}
