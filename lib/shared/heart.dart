import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  const Heart({super.key});

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  bool fav = false;
  late AnimationController _controller;
  late Animation _colorAnimation;
  Animation? sizeAnimation;
  Animation<double>? curve;

  // Initializing the animation controller and the animation
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
// CurvedAnimation to animate icon
    curve = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

// Tween to animate color of icon
    _colorAnimation =
        ColorTween(begin: Colors.grey[400], end: Colors.red).animate(curve!);

// TweenSequence to animate size of icon
    sizeAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 30.0, end: 50.0), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 50.0, end: 30.0), weight: 50),
    ]).animate(_controller);

// Adding listeners to the animation controller
    _controller.addListener(() {
      setState(() {
        print(_controller.value);
        print(_colorAnimation.value);
      });
    });

// Adding status listeners to the animation controller
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        fav = true;
      }
      if (status == AnimationStatus.dismissed) {
        fav = false;
      }
    });
  }

// Disposing the animation controller
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: ((context, child) => IconButton(
            icon: Icon(
              Icons.favorite,
              color: _colorAnimation.value,
              size: sizeAnimation?.value,
            ),
            onPressed: () {
              fav ? _controller.reverse() : _controller.forward();
            },
          )),
    );
  }
}
