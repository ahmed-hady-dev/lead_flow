import 'package:flutter/material.dart';
import 'package:lead_flow/core/helpers/extensions.dart';

class AnimatedTickIcon extends StatefulWidget {
  const AnimatedTickIcon({super.key});

  @override
  _AnimatedTickIconState createState() => _AnimatedTickIconState();
}

class _AnimatedTickIconState extends State<AnimatedTickIcon> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubicEmphasized),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: widget.height * 0.01),
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animation.value * 1,
                  child: child,
                );
              },
              child: Icon(
                Icons.check_circle_outline_rounded,
                color: Colors.green,
                size: widget.width * 0.35,
              ),
            ),
          ),
          Positioned.directional(
            start: 15,
            bottom: 35,
            textDirection: TextDirection.rtl,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animation.value * 1,
                  child: child,
                );
              },
              child: const CircleAvatar(
                radius: 12,
                backgroundColor: Colors.yellow,
              ),
            ),
          ),
          Positioned.directional(
            start: widget.width * 0.25,
            bottom: 0,
            textDirection: TextDirection.rtl,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animation.value * 1,
                  child: child,
                );
              },
              child: const CircleAvatar(
                radius: 6,
                backgroundColor: Colors.amber,
              ),
            ),
          ),
          Positioned.directional(
            end: widget.width * 0.01,
            bottom: 30,
            textDirection: TextDirection.rtl,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animation.value * 1,
                  child: child,
                );
              },
              child: const CircleAvatar(
                radius: 10,
                backgroundColor: Colors.amber,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
