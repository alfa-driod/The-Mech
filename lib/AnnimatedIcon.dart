import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class AnimatedSlideUp extends StatefulWidget {
  const AnimatedSlideUp({Key? key}) : super(key: key);

  @override
  _AnimatedSlideUpState createState() => _AnimatedSlideUpState();
}

class _AnimatedSlideUpState extends State<AnimatedSlideUp>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _position;
  late Animation<double> _opacity;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _position = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0, 1)),
    )..addListener(() {
        setState(() {});
      });

    _opacity = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(.5, 1)),
    )..addListener(() {
        setState(() {});
      });
    // Always repeat animation
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            'Slide Up For Nearby Autoshops',
            style: TextStyle(color: Colors.white),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: _position.value),
          child: Opacity(
            opacity: _opacity.value,
            child: Icon(
              Icons.horizontal_rule_rounded,
              color: Colors.white,
              size: 65,
            ),
          ),
        ),
      ],
    );
  }
}
