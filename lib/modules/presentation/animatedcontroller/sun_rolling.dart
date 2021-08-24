import 'package:flutter/material.dart';

class RollingImage extends StatefulWidget {
  final int duration;
  final String imageUrl;
  final double height;
  final double width;
  const RollingImage({
    Key key,
    this.duration = 10,
    this.width = 124,
    this.height = 124,
    this.imageUrl = 'assets/images/leme.png',
  }) : super(key: key);

  @override
  _RollingImageState createState() => _RollingImageState();
}

class _RollingImageState extends State<RollingImage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  double rotationAngle = 0;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.duration),
    );

    //animationController.repeat(reverse: true);
    animationController.forward();

    animationController.addListener(() {
      setState(() {
        rotationAngle = animationController.value * 10;
      });
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotationAngle,
      child: Container(
        color: Colors.transparent,
        width: widget.width,
        height: widget.height,
        child: Image.asset(
          widget.imageUrl,
        ),
      ),
    );
  }
}
